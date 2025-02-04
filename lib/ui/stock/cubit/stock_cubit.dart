import 'package:decimal/decimal.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:sanu/ui/cart/models/item_transaction.dart';
import 'package:sanu/ui/stock/cubit/stock_state.dart';
import 'package:sanu/ui/stock/models/item_stock.dart';

class StockCubit extends HydratedCubit<StockState> {
  StockCubit() : super(const StockState());

  void commit(List<ItemTransaction> transactions) {
    final updatedTransactions = [
      ...state.transactions,
      ...transactions,
    ];

    final stocks = updatedTransactions.fold<Map<String, ItemStock>>(
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
        transactions: updatedTransactions,
        stocks: stocks,
      ),
    );
  }

  @override
  StockState? fromJson(Map<String, dynamic> json) => StockState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(StockState state) => state.toJson();
}
