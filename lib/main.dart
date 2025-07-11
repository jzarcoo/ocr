// lib/main.dart

import 'package:flutter/material.dart';
import 'services/service_locator.dart';
import 'routes.dart';
import 'theme.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OCR App',
      debugShowCheckedModeBanner: false,

      // Temas claro y oscuro
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system, // usa la preferencia del sistema

      initialRoute: '/',
      routes: appRoutes,
    );
  }
}
