import 'package:bloc/bloc.dart';
import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sanu/ui/cart/models/item_transaction.dart';
import 'package:sanu/ui/category/models/item_category.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(const TransactionState());

  void upsertTransaction({required String itemId, required Decimal quantity}) {
    if (quantity == Decimal.zero) {
      final updatedTransactions = Map<String, ItemTransaction>.from(state.transactions)..remove(itemId);
      emit(
        state.copyWith(
          transactions: updatedTransactions,
        ),
      );
    } else {
      final transaction = ItemTransaction(
        itemId: itemId,
        quantity: quantity,
        type: state.type,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      emit(
        state.copyWith(
          transactions: Map<String, ItemTransaction>.from(state.transactions)..[itemId] = transaction,
        ),
      );
    }
  }

  void selectCategory(ItemCategory? category) {
    emit(
      state.copyWith(
        selectedCategory: () => category,
      ),
    );
  }

  void switchTransactionType() {
    emit(
      state.copyWith(
        type: state.type == ItemTransactionType.add ? ItemTransactionType.remove : ItemTransactionType.add,
        transactions: {},
        selectedCategory: () => null,
      ),
    );
  }

  void reset() {
    emit(const TransactionState());
  }
}
