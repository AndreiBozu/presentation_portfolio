import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  // await ScreenUtil.ensureScreenSize();
  // await AppConfig.initialize();

  runApp(
    ScreenUtilInit(
      designSize: const Size(1280, 700),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, child) {
        return const MyApp();
      },
    )
  );

  // runApp(const MyApp());
}