// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_service.dart';

// ignore_for_file: type=lint
class $TransactionsTable extends Transactions
    with TableInfo<$TransactionsTable, Transaction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _messageidMeta =
      const VerificationMeta('messageid');
  @override
  late final GeneratedColumn<int> messageid = GeneratedColumn<int>(
      'messageid', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _messageBodyMeta =
      const VerificationMeta('messageBody');
  @override
  late final GeneratedColumn<String> messageBody = GeneratedColumn<String>(
      'message_body', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _messageClassMeta =
      const VerificationMeta('messageClass');
  @override
  late final GeneratedColumn<String> messageClass = GeneratedColumn<String>(
      'message_class', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _modeMeta = const VerificationMeta('mode');
  @override
  late final GeneratedColumn<String> mode = GeneratedColumn<String>(
      'mode', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(null));
  static const VerificationMeta _bankMeta = const VerificationMeta('bank');
  @override
  late final GeneratedColumn<String> bank = GeneratedColumn<String>(
      'bank', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(null));
  static const VerificationMeta _refNumMeta = const VerificationMeta('refNum');
  @override
  late final GeneratedColumn<String> refNum = GeneratedColumn<String>(
      'ref_num', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(null));
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, true,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(null));
  static const VerificationMeta _fromAddMeta =
      const VerificationMeta('fromAdd');
  @override
  late final GeneratedColumn<String> fromAdd = GeneratedColumn<String>(
      'from_add', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(null));
  static const VerificationMeta _toAddMeta = const VerificationMeta('toAdd');
  @override
  late final GeneratedColumn<String> toAdd = GeneratedColumn<String>(
      'to_add', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(null));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _currencyMeta =
      const VerificationMeta('currency');
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
      'currency', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(null));
  static const VerificationMeta _accountNumMeta =
      const VerificationMeta('accountNum');
  @override
  late final GeneratedColumn<String> accountNum = GeneratedColumn<String>(
      'account_num', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(null));
  @override
  List<GeneratedColumn> get $columns => [
        messageid,
        messageBody,
        messageClass,
        mode,
        bank,
        refNum,
        amount,
        fromAdd,
        toAdd,
        date,
        currency,
        accountNum
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transactions';
  @override
  VerificationContext validateIntegrity(Insertable<Transaction> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('messageid')) {
      context.handle(_messageidMeta,
          messageid.isAcceptableOrUnknown(data['messageid']!, _messageidMeta));
    }
    if (data.containsKey('message_body')) {
      context.handle(
          _messageBodyMeta,
          messageBody.isAcceptableOrUnknown(
              data['message_body']!, _messageBodyMeta));
    } else if (isInserting) {
      context.missing(_messageBodyMeta);
    }
    if (data.containsKey('message_class')) {
      context.handle(
          _messageClassMeta,
          messageClass.isAcceptableOrUnknown(
              data['message_class']!, _messageClassMeta));
    } else if (isInserting) {
      context.missing(_messageClassMeta);
    }
    if (data.containsKey('mode')) {
      context.handle(
          _modeMeta, mode.isAcceptableOrUnknown(data['mode']!, _modeMeta));
    }
    if (data.containsKey('bank')) {
      context.handle(
          _bankMeta, bank.isAcceptableOrUnknown(data['bank']!, _bankMeta));
    }
    if (data.containsKey('ref_num')) {
      context.handle(_refNumMeta,
          refNum.isAcceptableOrUnknown(data['ref_num']!, _refNumMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    }
    if (data.containsKey('from_add')) {
      context.handle(_fromAddMeta,
          fromAdd.isAcceptableOrUnknown(data['from_add']!, _fromAddMeta));
    }
    if (data.containsKey('to_add')) {
      context.handle(
          _toAddMeta, toAdd.isAcceptableOrUnknown(data['to_add']!, _toAddMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('currency')) {
      context.handle(_currencyMeta,
          currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta));
    }
    if (data.containsKey('account_num')) {
      context.handle(
          _accountNumMeta,
          accountNum.isAcceptableOrUnknown(
              data['account_num']!, _accountNumMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {messageid};
  @override
  Transaction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Transaction(
      messageid: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}messageid'])!,
      messageBody: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}message_body'])!,
      messageClass: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}message_class'])!,
      mode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mode']),
      bank: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}bank']),
      refNum: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ref_num']),
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount']),
      fromAdd: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}from_add']),
      toAdd: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}to_add']),
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      currency: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}currency']),
      accountNum: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}account_num']),
    );
  }

  @override
  $TransactionsTable createAlias(String alias) {
    return $TransactionsTable(attachedDatabase, alias);
  }
}

class Transaction extends DataClass implements Insertable<Transaction> {
  final int messageid;
  final String messageBody;
  final String messageClass;
  final String? mode;
  final String? bank;
  final String? refNum;
  final double? amount;
  final String? fromAdd;
  final String? toAdd;
  final DateTime date;
  final String? currency;
  final String? accountNum;
  const Transaction(
      {required this.messageid,
      required this.messageBody,
      required this.messageClass,
      this.mode,
      this.bank,
      this.refNum,
      this.amount,
      this.fromAdd,
      this.toAdd,
      required this.date,
      this.currency,
      this.accountNum});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['messageid'] = Variable<int>(messageid);
    map['message_body'] = Variable<String>(messageBody);
    map['message_class'] = Variable<String>(messageClass);
    if (!nullToAbsent || mode != null) {
      map['mode'] = Variable<String>(mode);
    }
    if (!nullToAbsent || bank != null) {
      map['bank'] = Variable<String>(bank);
    }
    if (!nullToAbsent || refNum != null) {
      map['ref_num'] = Variable<String>(refNum);
    }
    if (!nullToAbsent || amount != null) {
      map['amount'] = Variable<double>(amount);
    }
    if (!nullToAbsent || fromAdd != null) {
      map['from_add'] = Variable<String>(fromAdd);
    }
    if (!nullToAbsent || toAdd != null) {
      map['to_add'] = Variable<String>(toAdd);
    }
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || currency != null) {
      map['currency'] = Variable<String>(currency);
    }
    if (!nullToAbsent || accountNum != null) {
      map['account_num'] = Variable<String>(accountNum);
    }
    return map;
  }

  TransactionsCompanion toCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      messageid: Value(messageid),
      messageBody: Value(messageBody),
      messageClass: Value(messageClass),
      mode: mode == null && nullToAbsent ? const Value.absent() : Value(mode),
      bank: bank == null && nullToAbsent ? const Value.absent() : Value(bank),
      refNum:
          refNum == null && nullToAbsent ? const Value.absent() : Value(refNum),
      amount:
          amount == null && nullToAbsent ? const Value.absent() : Value(amount),
      fromAdd: fromAdd == null && nullToAbsent
          ? const Value.absent()
          : Value(fromAdd),
      toAdd:
          toAdd == null && nullToAbsent ? const Value.absent() : Value(toAdd),
      date: Value(date),
      currency: currency == null && nullToAbsent
          ? const Value.absent()
          : Value(currency),
      accountNum: accountNum == null && nullToAbsent
          ? const Value.absent()
          : Value(accountNum),
    );
  }

  factory Transaction.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Transaction(
      messageid: serializer.fromJson<int>(json['messageid']),
      messageBody: serializer.fromJson<String>(json['messageBody']),
      messageClass: serializer.fromJson<String>(json['messageClass']),
      mode: serializer.fromJson<String?>(json['mode']),
      bank: serializer.fromJson<String?>(json['bank']),
      refNum: serializer.fromJson<String?>(json['refNum']),
      amount: serializer.fromJson<double?>(json['amount']),
      fromAdd: serializer.fromJson<String?>(json['fromAdd']),
      toAdd: serializer.fromJson<String?>(json['toAdd']),
      date: serializer.fromJson<DateTime>(json['date']),
      currency: serializer.fromJson<String?>(json['currency']),
      accountNum: serializer.fromJson<String?>(json['accountNum']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'messageid': serializer.toJson<int>(messageid),
      'messageBody': serializer.toJson<String>(messageBody),
      'messageClass': serializer.toJson<String>(messageClass),
      'mode': serializer.toJson<String?>(mode),
      'bank': serializer.toJson<String?>(bank),
      'refNum': serializer.toJson<String?>(refNum),
      'amount': serializer.toJson<double?>(amount),
      'fromAdd': serializer.toJson<String?>(fromAdd),
      'toAdd': serializer.toJson<String?>(toAdd),
      'date': serializer.toJson<DateTime>(date),
      'currency': serializer.toJson<String?>(currency),
      'accountNum': serializer.toJson<String?>(accountNum),
    };
  }

  Transaction copyWith(
          {int? messageid,
          String? messageBody,
          String? messageClass,
          Value<String?> mode = const Value.absent(),
          Value<String?> bank = const Value.absent(),
          Value<String?> refNum = const Value.absent(),
          Value<double?> amount = const Value.absent(),
          Value<String?> fromAdd = const Value.absent(),
          Value<String?> toAdd = const Value.absent(),
          DateTime? date,
          Value<String?> currency = const Value.absent(),
          Value<String?> accountNum = const Value.absent()}) =>
      Transaction(
        messageid: messageid ?? this.messageid,
        messageBody: messageBody ?? this.messageBody,
        messageClass: messageClass ?? this.messageClass,
        mode: mode.present ? mode.value : this.mode,
        bank: bank.present ? bank.value : this.bank,
        refNum: refNum.present ? refNum.value : this.refNum,
        amount: amount.present ? amount.value : this.amount,
        fromAdd: fromAdd.present ? fromAdd.value : this.fromAdd,
        toAdd: toAdd.present ? toAdd.value : this.toAdd,
        date: date ?? this.date,
        currency: currency.present ? currency.value : this.currency,
        accountNum: accountNum.present ? accountNum.value : this.accountNum,
      );
  @override
  String toString() {
    return (StringBuffer('Transaction(')
          ..write('messageid: $messageid, ')
          ..write('messageBody: $messageBody, ')
          ..write('messageClass: $messageClass, ')
          ..write('mode: $mode, ')
          ..write('bank: $bank, ')
          ..write('refNum: $refNum, ')
          ..write('amount: $amount, ')
          ..write('fromAdd: $fromAdd, ')
          ..write('toAdd: $toAdd, ')
          ..write('date: $date, ')
          ..write('currency: $currency, ')
          ..write('accountNum: $accountNum')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(messageid, messageBody, messageClass, mode,
      bank, refNum, amount, fromAdd, toAdd, date, currency, accountNum);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Transaction &&
          other.messageid == this.messageid &&
          other.messageBody == this.messageBody &&
          other.messageClass == this.messageClass &&
          other.mode == this.mode &&
          other.bank == this.bank &&
          other.refNum == this.refNum &&
          other.amount == this.amount &&
          other.fromAdd == this.fromAdd &&
          other.toAdd == this.toAdd &&
          other.date == this.date &&
          other.currency == this.currency &&
          other.accountNum == this.accountNum);
}

class TransactionsCompanion extends UpdateCompanion<Transaction> {
  final Value<int> messageid;
  final Value<String> messageBody;
  final Value<String> messageClass;
  final Value<String?> mode;
  final Value<String?> bank;
  final Value<String?> refNum;
  final Value<double?> amount;
  final Value<String?> fromAdd;
  final Value<String?> toAdd;
  final Value<DateTime> date;
  final Value<String?> currency;
  final Value<String?> accountNum;
  const TransactionsCompanion({
    this.messageid = const Value.absent(),
    this.messageBody = const Value.absent(),
    this.messageClass = const Value.absent(),
    this.mode = const Value.absent(),
    this.bank = const Value.absent(),
    this.refNum = const Value.absent(),
    this.amount = const Value.absent(),
    this.fromAdd = const Value.absent(),
    this.toAdd = const Value.absent(),
    this.date = const Value.absent(),
    this.currency = const Value.absent(),
    this.accountNum = const Value.absent(),
  });
  TransactionsCompanion.insert({
    this.messageid = const Value.absent(),
    required String messageBody,
    required String messageClass,
    this.mode = const Value.absent(),
    this.bank = const Value.absent(),
    this.refNum = const Value.absent(),
    this.amount = const Value.absent(),
    this.fromAdd = const Value.absent(),
    this.toAdd = const Value.absent(),
    required DateTime date,
    this.currency = const Value.absent(),
    this.accountNum = const Value.absent(),
  })  : messageBody = Value(messageBody),
        messageClass = Value(messageClass),
        date = Value(date);
  static Insertable<Transaction> custom({
    Expression<int>? messageid,
    Expression<String>? messageBody,
    Expression<String>? messageClass,
    Expression<String>? mode,
    Expression<String>? bank,
    Expression<String>? refNum,
    Expression<double>? amount,
    Expression<String>? fromAdd,
    Expression<String>? toAdd,
    Expression<DateTime>? date,
    Expression<String>? currency,
    Expression<String>? accountNum,
  }) {
    return RawValuesInsertable({
      if (messageid != null) 'messageid': messageid,
      if (messageBody != null) 'message_body': messageBody,
      if (messageClass != null) 'message_class': messageClass,
      if (mode != null) 'mode': mode,
      if (bank != null) 'bank': bank,
      if (refNum != null) 'ref_num': refNum,
      if (amount != null) 'amount': amount,
      if (fromAdd != null) 'from_add': fromAdd,
      if (toAdd != null) 'to_add': toAdd,
      if (date != null) 'date': date,
      if (currency != null) 'currency': currency,
      if (accountNum != null) 'account_num': accountNum,
    });
  }

  TransactionsCompanion copyWith(
      {Value<int>? messageid,
      Value<String>? messageBody,
      Value<String>? messageClass,
      Value<String?>? mode,
      Value<String?>? bank,
      Value<String?>? refNum,
      Value<double?>? amount,
      Value<String?>? fromAdd,
      Value<String?>? toAdd,
      Value<DateTime>? date,
      Value<String?>? currency,
      Value<String?>? accountNum}) {
    return TransactionsCompanion(
      messageid: messageid ?? this.messageid,
      messageBody: messageBody ?? this.messageBody,
      messageClass: messageClass ?? this.messageClass,
      mode: mode ?? this.mode,
      bank: bank ?? this.bank,
      refNum: refNum ?? this.refNum,
      amount: amount ?? this.amount,
      fromAdd: fromAdd ?? this.fromAdd,
      toAdd: toAdd ?? this.toAdd,
      date: date ?? this.date,
      currency: currency ?? this.currency,
      accountNum: accountNum ?? this.accountNum,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (messageid.present) {
      map['messageid'] = Variable<int>(messageid.value);
    }
    if (messageBody.present) {
      map['message_body'] = Variable<String>(messageBody.value);
    }
    if (messageClass.present) {
      map['message_class'] = Variable<String>(messageClass.value);
    }
    if (mode.present) {
      map['mode'] = Variable<String>(mode.value);
    }
    if (bank.present) {
      map['bank'] = Variable<String>(bank.value);
    }
    if (refNum.present) {
      map['ref_num'] = Variable<String>(refNum.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (fromAdd.present) {
      map['from_add'] = Variable<String>(fromAdd.value);
    }
    if (toAdd.present) {
      map['to_add'] = Variable<String>(toAdd.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (accountNum.present) {
      map['account_num'] = Variable<String>(accountNum.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsCompanion(')
          ..write('messageid: $messageid, ')
          ..write('messageBody: $messageBody, ')
          ..write('messageClass: $messageClass, ')
          ..write('mode: $mode, ')
          ..write('bank: $bank, ')
          ..write('refNum: $refNum, ')
          ..write('amount: $amount, ')
          ..write('fromAdd: $fromAdd, ')
          ..write('toAdd: $toAdd, ')
          ..write('date: $date, ')
          ..write('currency: $currency, ')
          ..write('accountNum: $accountNum')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $TransactionsTable transactions = $TransactionsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [transactions];
}
