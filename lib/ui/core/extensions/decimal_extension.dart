import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sanu/ui/settings/bloc/settings_cubit.dart';

extension XDecimal on Decimal {
  String toCurrencyFormat(BuildContext context) {
    final currency = context.read<SettingsCubit>().state.currency;

    final format = DecimalFormatter(
      NumberFormat.simpleCurrency(
        name: currency.code,
        decimalDigits: currency.digits,
      ),
    );

    return format.format(this);
  }
}
