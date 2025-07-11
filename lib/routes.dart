import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/manual_mode_page.dart';
import 'pages/automatic_mode_page.dart';
import 'pages/speed_select_page.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (_) => const HomePage(),
  '/manual': (_) => const ManualModePage(),
  '/automatic': (_) => const AutomaticModePage(),
  '/speed': (_) => const SpeedSelectPage(),
};
