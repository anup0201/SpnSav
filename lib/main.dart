import 'package:flutter/material.dart';
import 'package:notif/categorised.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:notif/database_service.dart';
import 'package:dynamic_color/dynamic_color.dart';

Future<List<Object>> countOfMessages() async {
  final database = AppDatabase();
  List<Transaction> allItems = await database.allTransactions();
  return [allItems.length, database];
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dbObjectandCount = await countOfMessages();
  runApp(
      MyApp(messagesCount: dbObjectandCount[0], database: dbObjectandCount[1]));
}

class MyApp extends StatelessWidget {
  final messagesCount;
  final database;

  const MyApp({super.key, required this.messagesCount, required this.database});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
      return MaterialApp(
        theme: ThemeData(useMaterial3: true, colorScheme: lightDynamic),
        darkTheme: ThemeData(useMaterial3: true, colorScheme: darkDynamic),
        title: 'Transactions',
        home: messagesCount > 1
            ? CategorisedMessages(database: database)
            : MyHomePage(title: 'SpnSav', database: database),
      );
    });
  }
}

class MyHomePage extends StatefulWidget {
  final AppDatabase database;

  MyHomePage({super.key, required this.title, required this.database});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool status = false;

  Future<void> getMessagePermission() async {
    if (await Permission.manageExternalStorage.isDenied) {
      await Permission.manageExternalStorage.request();
    }
    if (await Permission.sms.isDenied) {
      await Permission.sms.request();
    }
    final smsPermissionStatus = await Permission.sms.isGranted;
    final storagePermissionStatus =
        await Permission.manageExternalStorage.isGranted;

    if (smsPermissionStatus && storagePermissionStatus) {
      setState(() {
        status = smsPermissionStatus;
      });
    } else {
      openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    getMessagePermission();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: status
          ? Center(
              child: ElevatedButton(
                child: const Text("Get Messages"),
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CategorisedMessages(database: widget.database),
                  ),
                ),
              ),
            )
          : Center(
              child: ElevatedButton(
                  child: const Text("Grant Permission"),
                  onPressed: () => getMessagePermission()),
            ),
    );
  }
}
