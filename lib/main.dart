import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:riverpod_example/base/route/route_const.dart';
import 'package:riverpod_example/base/route/route_generator.dart';


void main() async {
  await initHiveStorage();
  runApp(
    const ScreenUtilInit(
      designSize: Size(1080, 720),
      child: ProviderScope(
        child: MyApp(),
      ),
    ),
  );
}

Future initHiveStorage() {
  return Hive.initFlutter();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.initialRoute,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}