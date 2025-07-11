import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  const BottomNavBar({super.key, required this.currentIndex});

  void _onItemTapped(BuildContext context, int index) {
    final routes = ['/manual', '/automatic', '/speed'];
    if (index != currentIndex) {
      Navigator.pushReplacementNamed(context, routes[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (i) => _onItemTapped(context, i),
      selectedItemColor: colorScheme.primary,
      unselectedItemColor: Colors.grey,
      backgroundColor: colorScheme.surface,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.touch_app),
          label: 'Manual',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.auto_mode),
          label: 'Automático',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.speed),
          label: 'Velocidad',
        ),
      ],
    );
  }
}
