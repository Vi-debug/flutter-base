import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';

import 'my_app.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  await initHiveStorage();
  runApp(
    const ScreenUtilInit(
      designSize: Size(360, 800),
      child: ProviderScope(
        child: MyApp(),
      ),
    ),
  );
}

Future initHiveStorage() {
  return Hive.initFlutter();
}
