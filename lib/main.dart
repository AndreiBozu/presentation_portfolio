import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:localstorage/localstorage.dart';
import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  await initLocalStorage();
  // await ScreenUtil.ensureScreenSize();
  // await AppConfig.initialize();
  final view = PlatformDispatcher.instance.views.first;
  final physicalSize = view.physicalSize;
  final devicePixelRatio = view.devicePixelRatio;
  final logicalSize = physicalSize / devicePixelRatio;
  final double ratio = logicalSize.width/logicalSize.height;

  localStorage.setItem("width", logicalSize.width.toString());
  localStorage.setItem("height", logicalSize.height.toString());


  runApp(
    ProviderScope(
      child: ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: ratio <= 1 ? const Size(720, 1280) : const Size(1280, 720),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, child) {
          return const MyApp();
        },
      )
    )
  );

  // runApp(const MyApp());
}