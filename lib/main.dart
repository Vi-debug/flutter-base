import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:riverpod_example/controller/home_controller.dart';
import 'package:riverpod_example/controller/login_controller.dart';

import 'my_app.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  await initHiveStorage();
  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 800),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => HomeController()),
          ChangeNotifierProvider(create: (context) => LoginController()),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

Future initHiveStorage() {
  return Hive.initFlutter();
}
