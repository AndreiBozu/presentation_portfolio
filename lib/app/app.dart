import 'dart:ui';
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:presentation_portfolio/app/app_config.dart';
import '../routes.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final double maxDeviation = AppConfig.maxSizeDeviation;
  double lWidth = 0;
  double lHeight = 0;

  @override
  void initState() {
    final String? sWidth = localStorage.getItem("width");
    final String? sHeight = localStorage.getItem("height");
    final view = PlatformDispatcher.instance.views.first;
    final physicalSize = view.physicalSize;
    final devicePixelRatio = view.devicePixelRatio;
    final logicalSize = physicalSize / devicePixelRatio;

    if(sWidth != null && sHeight != null) {
      setState(() {
        lWidth = double.tryParse(sWidth) ?? logicalSize.width;
        lHeight = double.tryParse(sHeight) ?? logicalSize.height;
      });
    } else {
      lWidth = logicalSize.width;
      lHeight = logicalSize.height;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final view = PlatformDispatcher.instance.views.first;
    final physicalSize = view.physicalSize;
    final devicePixelRatio = view.devicePixelRatio;
    final logicalSize = physicalSize / devicePixelRatio;
    final double logW = logicalSize.width;
    final double logH = logicalSize.height;

    if((logW < (lWidth - maxDeviation)) || (logW > (lWidth + maxDeviation)) || (logH > (lHeight + maxDeviation)) || (logH < (lHeight - maxDeviation))) {
      html.window.location.reload();
    }

    return MaterialApp.router(
      title: "Andrei Bozu",
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: true,
    );
  }
}