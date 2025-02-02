part of 'transaction_cubit.dart';

@immutable
class TransactionState extends Equatable {
  const TransactionState({
    this.transactions = const [],
    this.type = ItemTransactionType.remove,
  });

  final List<ItemTransaction> transactions;
  final ItemTransactionType type;

  Decimal get total => transactions.fold(Decimal.zero, (sum, item) => sum + item.quantity * item.item.price);

  TransactionState copyWith({
    List<ItemTransaction>? transactions,
    ItemTransactionType? type,
  }) {
    return TransactionState(
      transactions: transactions ?? this.transactions,
      type: type ?? this.type,
    );
  }

  @override
  List<Object> get props => [
        transactions,
        type,
      ];
}
