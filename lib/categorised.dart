import 'dart:convert';
import 'dart:io';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:notif/data_model.dart' as dt;
import 'package:path/path.dart' as p;
import 'package:notif/database_service.dart';
import 'package:notif/geminillm.dart';
import 'package:path_provider/path_provider.dart';

class CategorisedMessages extends StatefulWidget {
  final AppDatabase database;

  const CategorisedMessages({super.key, required this.database});

  @override
  State<CategorisedMessages> createState() => _CategorisedMessagesState();
}

class _CategorisedMessagesState extends State<CategorisedMessages>
    with SingleTickerProviderStateMixin {
  List<Transaction> listOfCategorisedMessages = [];
  final List listOfMessages = [];
  List<Transaction> listOfIncomeMessages = [];
  List<Transaction> listOfSpends = [];
  int totalToProcess = 0;
  int processed = 0;
  bool processing = false;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  saveFile() async {
    // await Permission.accessMediaLocation.request();

    var downloadPath = '/storage/emulated/0/Download/appdb.db';
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    List<int> dbbytes = await file.readAsBytes();
    final downloadFile = File(downloadPath);
    await downloadFile.writeAsBytes(dbbytes);
  }

  getMessages() async {
    List listOfMessages = [];
    final SmsQuery query = SmsQuery();
    final messages = await query.querySms(
      kinds: [SmsQueryKind.inbox],
    );

    // Getting only the transactions messages for the words that are in the
    // messages
    for (int i = 0; i < messages.length; i++) {
      if (messages[i].body!.contains("rs") ||
          messages[i].body!.contains("debited") ||
          messages[i].body!.contains("credited") ||
          messages[i].body!.contains('Spent') ||
          messages[i].body!.contains('spent') ||
          messages[i].body!.contains('dr') ||
          messages[i].body!.contains('cr') ||
          messages[i].body!.contains('bank') ||
          messages[i].body!.contains("Rs")) listOfMessages.add(messages[i]);
    }
    var listResults = await messageCategorization(listOfMessages);

    setState(() {
      listOfCategorisedMessages = listResults[0];
      listOfIncomeMessages = listResults[1];
      listOfSpends = listResults[2];
    });
  }

  messageCategorization(listOfMessages) async {
    setState(() {
      processing = true;
    });

    dt.Transactions data;
    List alreadyCategorisedIds = await widget.database.allTransactions();
    int startIndex = alreadyCategorisedIds.length;
    List messageIds = List.generate(alreadyCategorisedIds.length,
        (index) => alreadyCategorisedIds[index].messageid);
    int stopIndex = listOfMessages.length;
    const apiKey = String.fromEnvironment('API_KEY');
    final model =
        GenerativeModel(apiKey: apiKey, model: 'gemini-1.0-pro-latest');
    for (startIndex; startIndex < stopIndex; startIndex++) {
      if (!messageIds.contains(listOfMessages[startIndex].id)) {
        bool retry = true;
        final input = PromptFormating(listOfMessages[startIndex].body);
        final content = [Content.text(input.toString())];

        while (retry) {
          try {
            final response = await model.generateContent(content);
            Map<String, dynamic> jsonDecoded =
                json.decode(response.text.toString());

            try {
              jsonDecoded['Amount'] = jsonDecoded['Amount'] == 'NA'
                  ? 0.0
                  : jsonDecoded['Amount'] is String
                      ? double.parse(jsonDecoded['Amount'])
                      : jsonDecoded['Amount'].toDouble();
              data = dt.Transactions.fromJson(
                  jsonDecoded,
                  listOfMessages[startIndex].body,
                  listOfMessages[startIndex].id,
                  listOfMessages[startIndex].date);
              widget.database.into(widget.database.transactions).insert(
                  TransactionsCompanion.insert(
                      messageid: Value(data.messageId),
                      messageClass: data.messageClass,
                      messageBody: data.messageBody,
                      mode: data.Mode == 'NA'
                          ? const Value.absent()
                          : Value(data.Mode),
                      bank: data.Bank == 'NA'
                          ? const Value.absent()
                          : Value(data.Bank),
                      refNum: data.RefNum == 'NA'
                          ? const Value.absent()
                          : Value(data.RefNum),
                      amount: data.Amount == 'NA'
                          ? const Value.absent()
                          : Value(data.Amount),
                      fromAdd: data.FromAddress == 'NA'
                          ? const Value.absent()
                          : Value(data.FromAddress),
                      toAdd: data.ToAddress == 'NA'
                          ? const Value.absent()
                          : Value(data.ToAddress),
                      date: data.Date,
                      currency: data.currency == 'NA'
                          ? const Value.absent()
                          : Value(data.currency)));
              // sleep(const Duration(seconds: 2));
              retry = false;
            } on Exception catch (_) {
              retry = true;
            }
          } on Exception catch (_) {
            if (_.toString().contains("blocked")) {
              retry = false;
            } else {
              retry = true;
            }
          }
        }
      }

      setState(() {
        if (startIndex == stopIndex - 1) {
          processing = false;
        } else {
          processed = startIndex;
          totalToProcess = stopIndex;
        }
      });
    }
    await widget.database.updateTransactionsClass();
    listOfCategorisedMessages = await widget.database.allTransactions();
    listOfIncomeMessages =
        await widget.database.allTransactionsByClass('Received');

    listOfSpends = await widget.database.allTransactionsByClass('Spent');

    return [listOfCategorisedMessages, listOfIncomeMessages, listOfSpends];
  }

  void getSpendAndIncome() async {
    // listOfIncomeMessages = await database.getAllIncomes();
    // listOfSpends = await database.getAllSpends();
    setState(() {
      listOfIncomeMessages;
      listOfSpends;
    });
  }

  @override
  void initState() {
    getMessages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getSpendAndIncome();
    List<Widget> widgetOptions = <Widget>[
      TransactionListViewBuilder(listOfTransactions: listOfIncomeMessages),
      TransactionListViewBuilder(listOfTransactions: listOfSpends)
    ];
    return Scaffold(
      appBar: AppBar(title: const Text("SpnSav")),
      body: Center(
          child: processing
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "${processed.toString()}/${totalToProcess.toString()}"),
                    const SizedBox(
                      width: 35,
                    ),
                    Text(
                        ((processed / totalToProcess) * 100).toStringAsFixed(2))
                  ],
                )
              : widgetOptions.elementAt(_selectedIndex)),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () => saveFile(),
            child: const Icon(Icons.download),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            child: const Icon(Icons.read_more_outlined),
            onPressed: () => getMessages(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_downward_outlined, color: Colors.green[400]),
            label: 'Income',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_upward_outlined, color: Colors.red[400]),
            label: 'Spent',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class TransactionListViewBuilder extends StatelessWidget {
  const TransactionListViewBuilder({
    super.key,
    required this.listOfTransactions,
  });

  final List listOfTransactions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
              margin: const EdgeInsets.all(5),
              child: SizedBox(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 40,
                      ),
                      Text(listOfTransactions[index].amount.toString()),
                      const SizedBox(
                        width: 40,
                      ),
                      Text(listOfTransactions[index].bank),
                      const SizedBox(
                        width: 40,
                      ),
                      Text(listOfTransactions[index].date.toString())
                    ],
                  ),
                ),
              ));
        },
        itemCount: listOfTransactions.length,
      ),
    );
  }
}
