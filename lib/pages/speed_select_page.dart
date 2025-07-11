import 'package:flutter/material.dart';
import '../controllers/speed_controller.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/speed_select/speed_button.dart';

class SpeedSelectPage extends StatelessWidget {
  const SpeedSelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final controller = SpeedController();

    return Scaffold(
      appBar: const CustomAppBar(title: 'Configuración de velocidad'),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              Text(
                'Ajusta la velocidad',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 32),
              ...controller.options.map(
                (option) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: SpeedButton(
                    label: option.label,
                    color: _getColor(option.label, colorScheme),
                    textColor: Colors.white,
                    onTap: () => controller.setSpeed(option, context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 2),
    );
  }

  Color _getColor(String label, ColorScheme scheme) {
    switch (label) {
      case 'Rápido':
        return scheme.primary;
      case 'Medio':
        return scheme.secondary;
      case 'Lento':
        return scheme.tertiary;
      default:
        return scheme.primary;
    }
  }
}
