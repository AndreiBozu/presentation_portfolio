import 'package:flutter/material.dart';
import '../routes.dart'; // Example page

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'My Flutter Web App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: AppRouter.router, // Your declarative route setup
      debugShowCheckedModeBanner: false,
    );
  }
}