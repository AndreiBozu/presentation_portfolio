import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:localstorage/localstorage.dart';
import 'app/app.dart';
import 'app/app_config.dart';

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

  // Base design sizes the UI was authored against.
  final Size baseDesign = ratio <= 1 ? const Size(720, 1280) : const Size(1280, 720);

  // Clamp the design size up so the effective ScreenUtil scale never exceeds
  // [AppConfig.maxScaleFactor]. Below the cap the behaviour is identical to the
  // base design; above it, widgets stop growing so the UI doesn't become
  // oversized on large monitors.
  final double maxScale = AppConfig.maxScaleFactor;
  final Size designSize = Size(
    math.max(baseDesign.width, logicalSize.width / maxScale),
    math.max(baseDesign.height, logicalSize.height / maxScale),
  );

  runApp(
    ProviderScope(
      child: ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: designSize,
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