import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'package:riverpod_example/base/theme/theme_const.dart';
import 'package:riverpod_example/base/theme/theme_controller.dart';

import 'base/route/route_const.dart';
import 'base/route/route_generator.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(
      builder: (ctx, themeController, _) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeController.themeMode,
          initialRoute: Routes.initialRoute,
          onGenerateRoute: RouteGenerator.generateRoute,
        );
      }
    );
  }
}
