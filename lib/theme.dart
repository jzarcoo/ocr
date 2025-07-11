import 'package:flutter/material.dart';

const primaryAmberDark = Color(0xFFD0891C);
const primaryAmberLight = Color(0xFFFFC238);
const primaryTeal       = Color(0xFF3DE2D0);
const primaryPurple     = Color(0xFFC47FFB);
const accentPurple      = Color(0xFF8B4AC1);

final lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: primaryAmberLight,
  onPrimary: Colors.black,
  secondary: primaryTeal,
  onSecondary: Colors.black,
  surface: Colors.white,
  onSurface: Colors.black,
  error: Colors.red.shade700,
  onError: Colors.white,
  tertiary: primaryPurple, // un color extra si lo quieres usar
  onTertiary: Colors.black,
);

final darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: primaryAmberDark,
  onPrimary: Colors.black,
  secondary: primaryTeal,
  onSecondary: Colors.black,
  surface: const Color(0xFF1E1E1E),
  onSurface: Colors.white,
  error: Colors.red.shade400,
  onError: Colors.black,
  tertiary: accentPurple,
  onTertiary: Colors.white,
);

final lightTheme = ThemeData(
  colorScheme: lightColorScheme,
  useMaterial3: true,
  scaffoldBackgroundColor: lightColorScheme.surface,
  appBarTheme: AppBarTheme(
    backgroundColor: lightColorScheme.primary,
    foregroundColor: lightColorScheme.onPrimary,
    elevation: 0,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: lightColorScheme.surface,
    selectedItemColor: lightColorScheme.primary,
    unselectedItemColor: Colors.grey,
  ),
  textTheme: const TextTheme(
    headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    bodyMedium: TextStyle(fontSize: 16),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: lightColorScheme.secondary,
      foregroundColor: lightColorScheme.onSecondary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
    ),
  ),
);

final darkTheme = ThemeData(
  colorScheme: darkColorScheme,
  useMaterial3: true,
  scaffoldBackgroundColor: darkColorScheme.surface,
  appBarTheme: AppBarTheme(
    backgroundColor: darkColorScheme.primary,
    foregroundColor: darkColorScheme.onPrimary,
    elevation: 0,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: darkColorScheme.surface,
    selectedItemColor: darkColorScheme.primary,
    unselectedItemColor: Colors.grey,
  ),
  textTheme: const TextTheme(
    headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    bodyMedium: TextStyle(fontSize: 16),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: darkColorScheme.secondary,
      foregroundColor: darkColorScheme.onSecondary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
    ),
  ),
);
