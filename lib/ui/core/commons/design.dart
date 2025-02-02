import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanu/ui/settings/bloc/settings_cubit.dart';

class Design {
  static List<BoxShadow> baseShadow(BuildContext context) => [
        BoxShadow(
          color: shadowColor(context),
          blurRadius: 6,
          spreadRadius: 2,
        ),
      ];

  static Color shadowColor(BuildContext context) {
    var opacity = 0.1;
    if (context.read<SettingsCubit>().isDarkMode) {
      opacity = 0.5;
    }
    return Theme.of(context).colorScheme.shadow.withValues(alpha: opacity);
  }
}
