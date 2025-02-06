import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:sanu/ui/cart/models/item_transaction.dart';
import 'package:sanu/ui/category/models/item_category.dart';
import 'package:sanu/ui/item/models/item.dart';
import 'package:uuid/uuid.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    ItemTransactionTable,
    ItemCategoryTable,
    ItemTable,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'sanu_database',
    );
  }
}
