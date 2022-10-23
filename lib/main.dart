import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:riverpod_example/base/config/config.dart';
import 'package:riverpod_example/base/theme/theme_controller.dart';
import 'package:riverpod_example/controller/home_controller.dart';
import 'package:riverpod_example/controller/login_controller.dart';

import 'my_app.dart';

void main() async {
  await dotenv.load(fileName: Environment.fileName);
  await EasyLocalization.ensureInitialized();
  await initHiveStorage();
  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 800),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => HomeController()),
          ChangeNotifierProvider(create: (context) => LoginController()),
          ChangeNotifierProvider(create: (context) => ThemeController()),
        ],
        child: EasyLocalization(
          path: 'assets/translations',
          supportedLocales: const [Locale('vi'), Locale('en')],
          fallbackLocale: const Locale('vi'),
          child: const MyApp(),
          startLocale: const Locale('vi'),
        ),
      ),
    ),
  );
}

Future initHiveStorage() {
  return Hive.initFlutter();
}
