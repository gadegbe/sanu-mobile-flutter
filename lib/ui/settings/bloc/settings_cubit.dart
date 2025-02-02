import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'settings_state.dart';

class SettingsCubit extends HydratedCubit<SettingsState> {
  SettingsCubit()
      : super(
          const SettingsState(
            locale: Locale('en'),
          ),
        );

  void changeTheme(ThemeMode themeMode) {
    emit(state.copyWith(themeMode: themeMode));
  }

  void changeLocale(Locale locale) {
    emit(state.copyWith(locale: locale));
  }

  bool get isDarkMode {
    final brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
    return state.themeMode == ThemeMode.dark || (brightness == Brightness.dark && state.themeMode == ThemeMode.system);
  }

  bool get isLightMode {
    final brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
    return state.themeMode == ThemeMode.light ||
        (brightness == Brightness.light && state.themeMode == ThemeMode.system);
  }

  @override
  SettingsState? fromJson(Map<String, dynamic> json) => SettingsState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(SettingsState state) => state.toJson();
}
