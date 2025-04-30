import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart'; // For removing '#' in web URLs
import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Optional: Set URL strategy for cleaner web URLs (no hash '#')
  usePathUrlStrategy();

  // Optional: Load environment config or other setup here
  // await AppConfig.initialize();

  runApp(const MyApp());
}