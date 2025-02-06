import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

mixin TableMixin on Table {
  late final id = text().clientDefault(() => const Uuid().v4())();
  late final createdAt = dateTime().withDefault(currentDateAndTime)();
  late final updatedAt = dateTime().withDefault(currentDateAndTime)();
}
