import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanu/ui/message/bloc/message_cubit.dart';
import 'package:sanu/ui/message/models/message.dart';

extension XBuildContext on BuildContext {
  void showMessage(Message message) {
    read<MessageCubit>().show(message);
  }

  void clearMessage() {
    read<MessageCubit>().show(null);
  }

  ModalRoute<T>? modalRoute<T extends Object?>() => ModalRoute.of<T>(this);

  NavigatorState get navigator => Navigator.of(this);

  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  ColorScheme get colorScheme => theme.colorScheme;

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  T? readOrNull<T>() {
    try {
      return read<T>();
    } on ProviderNotFoundException catch (_) {
      return null;
    }
  }

  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenHeight => MediaQuery.of(this).size.height;
}
