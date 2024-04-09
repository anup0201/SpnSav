import 'dart:async';
import 'dart:io';
import 'package:path/path.dart' as p;
// import 'data_model.dart' as dt;
import 'package:path_provider/path_provider.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'database_service.g.dart';

// to generate part file dart run build_runner watch
class Transactions extends Table {
  IntColumn get messageid => integer()();
  TextColumn get messageBody => text()();
  TextColumn get messageClass => text()();
  TextColumn get mode => text().nullable().withDefault(const Constant(null))();
  TextColumn get bank => text().nullable().withDefault(const Constant(null))();
  TextColumn get refNum =>
      text().nullable().withDefault(const Constant(null))();
  RealColumn get amount =>
      real().nullable().withDefault(const Constant(null))();
  TextColumn get fromAdd =>
      text().nullable().withDefault(const Constant(null))();
  TextColumn get toAdd => text().nullable().withDefault(const Constant(null))();
  DateTimeColumn get date => dateTime()();
  TextColumn get currency =>
      text().nullable().withDefault(const Constant(null))();
  TextColumn get accountNum =>
      text().nullable().withDefault(const Constant(null))();

  @override
  Set<Column> get primaryKey => {messageid};
}

@DriftDatabase(tables: [Transactions])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Transaction>> allTransactions() => select(transactions).get();

  Future<List<Transaction>> allTransactionsByClass(String messageClass) {
    return (select(transactions)
          ..where((tran) => tran.messageClass.equals(messageClass)))
        .get();
  }

  Future updateTransactionsClass() {
    return (update(transactions)
          ..where((t) => t.bank.isNull())
          ..where((t) => t.mode.isNull())
          ..where((t) => t.messageClass.equals('Spent')))
        .write(
      const TransactionsCompanion(
        messageClass: Value('Information'),
      ),
    );
  }

  // Future<int> addTransaction(dt.Transactions entry) {
  //   return into(transactions).insert(TransactionsCompanion(
  //     messageid: Value(entry.messageId),
  //     messageBody: Value(entry.messageBody),
  //   ));
  // }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    // Also work around limitations on old Android versions
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    // Make sqlite3 pick a more suitable location for temporary files - the
    // one from the system may be inaccessible due to sandboxing.
    final cachebase = (await getTemporaryDirectory()).path;
    // We can't access /tmp on Android, which sqlite3 would try by default.
    // Explicitly tell it about the correct temporary directory.
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}
