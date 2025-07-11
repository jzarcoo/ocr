import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'ocr',
                style: textTheme.headlineSmall?.copyWith(
                  color: colorScheme.tertiary,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                '¿Cómo quieres empezar?',
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 32),
              _ModeButton(
                label: 'Modo manual',
                color: colorScheme.secondary,
                textColor: colorScheme.onSecondary,
                onTap: () => Navigator.pushNamed(context, '/manual'),
              ),
              const SizedBox(height: 16),
              _ModeButton(
                label: 'Modo automático',
                color: colorScheme.primary,
                textColor: colorScheme.onPrimary,
                onTap: () => Navigator.pushNamed(context, '/automatic'),
              ),
              const SizedBox(height: 32),
              IconButton(
                icon: Icon(Icons.speed, color: colorScheme.tertiary),
                onPressed: () {
                  Navigator.pushNamed(context, '/speed');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ModeButton extends StatelessWidget {
  final String label;
  final Color color;
  final Color textColor;
  final VoidCallback onTap;

  const _ModeButton({
    required this.label,
    required this.color,
    required this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 24),
        height: 80,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(fontSize: 20, color: textColor),
          ),
        ),
      ),
    );
  }
}
