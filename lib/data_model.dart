class Transactions {
  late String messageClass;
  late var Mode;
  late var Bank;
  late var RefNum;
  late double Amount;
  late var FromAddress;
  late var ToAddress;
  DateTime Date;
  final int messageId;
  String messageBody;
  late var currency;
  late String accountNum;

  Transactions(
      {required this.messageClass,
      required this.Amount,
      required this.Mode,
      required this.Bank,
      required this.FromAddress,
      required this.RefNum,
      required this.ToAddress,
      required this.messageId,
      required this.messageBody,
      required this.Date,
      required this.currency,
      required this.accountNum});

  Transactions.fromJson(
      Map<String, dynamic> json, this.messageBody, this.messageId, this.Date) {
    messageClass = json['Class'];
    Mode = json['Mode'];
    Bank = json['Bank'];
    RefNum = json['RefNum'];
    Amount = json['Amount'];
    FromAddress = json['FromAddress'];
    ToAddress = json['ToAddress'];
    currency = json['Currency'];
    accountNum = json['Account Num'];
  }

  factory Transactions.fromMap(Map<String, dynamic> map) => Transactions(
      messageId: map['messageId'],
      messageBody: map['messageBody'],
      messageClass: map['class'], // Adjust key name if different
      Date: map['date'],
      Mode: map['mode'],
      Bank: map['bank'],
      RefNum: map['reference'],
      Amount: map['amount'],
      FromAddress: map['fromAddress'],
      ToAddress: map['toAddress'],
      currency: map['currency'],
      accountNum: map['accountNum']);

  Map<String, Object?> toMap() {
    return {
      "messageId": messageId,
      "messageBody": messageBody,
      "Class": messageClass,
      "Date": Date,
      "Mode": Mode,
      "Bank": Bank,
      "Refrence": RefNum,
      "Amount": Amount,
      "FromAddress": FromAddress,
      "ToAddress": ToAddress,
      "currency": currency,
      "accountNum": accountNum
    };
  }
}
