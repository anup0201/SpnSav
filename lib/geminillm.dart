class PromptFormating {
  final String inputPrompt =
      """Return a json with keys and values as described in this sample json
{
  "Class" : "either of (Spent, Bill Information, Spam, Received, Information)",
  "Mode" : "Mode of Transaction", 
  "Bank" :" Bank of the user from which transaction is made", 
  "Account Num" : "Corresponding bank account Number of the bank",
  "RefNum" : "Refrence Number or Identifier of Transaction",
  "Amount" : "Amount of Transaction without currency in decimal format",
  "FromAddress" : " ",
  "ToAddress" : " ",
  "Currency" : " "
}
for the following Transactional Message Don't look for other keys if the Message type is Spam and if it is Information mark keys as NA if some of them are not found :
""";
  final String messageBody;

  PromptFormating(this.messageBody);

  @override
  String toString() {
    return '$inputPrompt $messageBody';
  }
}
