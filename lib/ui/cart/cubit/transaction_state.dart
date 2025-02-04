part of 'transaction_cubit.dart';

@immutable
class TransactionState extends Equatable {
  const TransactionState({
    this.transactions = const {},
    this.type = ItemTransactionType.remove,
    this.selectedCategory,
  });

  final Map<String, ItemTransaction> transactions;
  final ItemTransactionType type;
  final ItemCategory? selectedCategory;

  TransactionState copyWith({
    Map<String, ItemTransaction>? transactions,
    ItemTransactionType? type,
    ValueGetter<ItemCategory?>? selectedCategory,
  }) {
    return TransactionState(
      transactions: transactions ?? this.transactions,
      type: type ?? this.type,
      selectedCategory: selectedCategory != null ? selectedCategory() : this.selectedCategory,
    );
  }

  @override
  List<Object?> get props => [
        transactions,
        type,
        selectedCategory,
      ];
}
