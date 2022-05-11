import 'package:flutter/material.dart';

import 'base/route/route_const.dart';
import 'base/route/route_generator.dart';
import 'base/theme/app_theme.dart';
import 'const/font_family.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        fontFamily: FontFamily.roboto,
        textTheme: TextTheme(
          headlineLarge: AppTheme.headLineLarge,
          headlineMedium: AppTheme.headLineMedium,
          headlineSmall: AppTheme.headLineSmall,
          titleLarge: AppTheme.titleLarge,
          titleMedium: AppTheme.titleMedium,
          titleSmall: AppTheme.titleSmall,
          bodyLarge: AppTheme.bodyLarge,
          bodyMedium: AppTheme.bodyMedium,
          bodySmall: AppTheme.bodySmall,
        ),
      ),
      initialRoute: Routes.initialRoute,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
