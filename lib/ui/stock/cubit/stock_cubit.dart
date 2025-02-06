import 'package:decimal/decimal.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:sanu/ui/cart/models/item_transaction.dart';
import 'package:sanu/ui/core/databases/database.dart';
import 'package:sanu/ui/stock/cubit/stock_state.dart';
import 'package:sanu/ui/stock/models/item_stock.dart';
import 'package:uuid/uuid.dart';

class StockCubit extends Cubit<StockState> {
  StockCubit({required this.database}) : super(const StockState()) {
    load();
  }

  final AppDatabase database;

  Future<void> load() async {
    final transactions = await database.select(database.itemTransactionTable).get();
    final transactionsList = transactions.map(ItemTransaction.fromData).toList();
    emit(state.copyWith(transactions: transactionsList));
    refreshStocks();
  }

  void refreshStocks() {
    final stocks = state.transactions.fold<Map<String, ItemStock>>(
      {},
      (items, transaction) {
        final quantity = items[transaction.itemId]?.quantity ?? Decimal.zero;
        final updatedQuantity = transaction.type == ItemTransactionType.add
            ? quantity + transaction.quantity
            : quantity - transaction.quantity;

        if (updatedQuantity > Decimal.zero) {
          items[transaction.itemId] = ItemStock(
            itemId: transaction.itemId,
            quantity: updatedQuantity,
          );
        }

        return items;
      },
    );

    emit(
      state.copyWith(
        stocks: stocks,
      ),
    );
  }

  Future<void> commit(List<ItemTransaction> transactions) async {
    await Future.wait(
      transactions.map((transaction) async {
        return database.into(database.itemTransactionTable).insert(
              ItemTransactionTableData(
                id: const Uuid().v4(),
                item: transaction.itemId,
                quantity: transaction.quantity.toString(),
                type: transaction.type,
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
              ),
            );
      }),
    );

    await load();
  }
}
