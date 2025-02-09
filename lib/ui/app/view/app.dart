import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sanu/l10n/l10n.dart';
import 'package:sanu/ui/cart/cubit/transaction_cubit.dart';
import 'package:sanu/ui/category/cubit/category_cubit.dart';
import 'package:sanu/ui/core/databases/database.dart';
import 'package:sanu/ui/core/routers/router.dart';
import 'package:sanu/ui/item/cubit/item_cubit.dart';
import 'package:sanu/ui/message/bloc/message_cubit.dart';
import 'package:sanu/ui/settings/bloc/settings_cubit.dart';
import 'package:sanu/ui/stock/cubit/stock_cubit.dart';
import 'package:sanu/ui/theme/theme.dart';
import 'package:sanu/ui/theme/util.dart';

class App extends StatelessWidget {
  App({super.key});
  late final database = AppDatabase();

  @override
  Widget build(BuildContext context) {
    final textTheme = createTextTheme(context, 'Poppins', 'Poppins');
    final theme = MaterialTheme(textTheme);
    final categoryCubit = CategoryCubit(database: database);

    return MultiProvider(
      providers: [
        BlocProvider(
          create: (context) => categoryCubit,
        ),
        BlocProvider(
          create: (context) => ItemCubit(
            database: database,
            categoryCubit: categoryCubit,
          ),
        ),
        BlocProvider(
          create: (context) => TransactionCubit(),
        ),
        BlocProvider(
          create: (context) => StockCubit(database: database),
        ),
        BlocProvider(
          create: (context) => MessageCubit(),
        ),
        BlocProvider(
          create: (context) => SettingsCubit(),
        ),
        Provider(create: (context) => database),
      ],
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return MaterialApp.router(
            routerConfig: router,
            theme: theme.light(),
            darkTheme: theme.dark(),
            themeMode: state.themeMode,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: state.locales,
            locale: state.locale,
          );
        },
      ),
    );
  }
}
