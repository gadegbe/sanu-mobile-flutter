import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanu/l10n/l10n.dart';
import 'package:sanu/ui/core/extensions/locale_extensions.dart';
import 'package:sanu/ui/core/extensions/object_extension.dart';
import 'package:sanu/ui/core/extensions/theme_mode_extension.dart';
import 'package:sanu/ui/settings/bloc/settings_cubit.dart';
import 'package:sanu/ui/settings/widgets/contact_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  static const route = 'settings';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.settingsTitle),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(context.l10n.appearance),
                  DropdownButtonFormField(
                    value: state.themeMode,
                    isExpanded: true,
                    onChanged: (value) {
                      if (value.isNotNull) {
                        context.read<SettingsCubit>().changeTheme(value!);
                      }
                    },
                    items: ThemeMode.values.map((ThemeMode value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(
                          value.title(context),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  Text(context.l10n.localeChange),
                  DropdownButtonFormField(
                    value: state.locale,
                    isExpanded: true,
                    onChanged: (value) {
                      if (value.isNotNull) {
                        context.read<SettingsCubit>().changeLocale(value!);
                      }
                    },
                    items: state.locales.map((Locale value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(
                          value.title(context),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      showAboutDialog(
                        context: context,
                        children: [
                          const ContactWidget(),
                        ],
                      );
                    },
                    child: Text(context.l10n.about),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
