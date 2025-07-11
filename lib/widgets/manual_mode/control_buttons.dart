import 'package:flutter/material.dart';

class ControlButtons extends StatelessWidget {
  final VoidCallback onSpeak;
  final VoidCallback onStop;
  final bool isTextAvailable;

  const ControlButtons({
    super.key,
    required this.onSpeak,
    required this.onStop,
    required this.isTextAvailable,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          onPressed: isTextAvailable ? onSpeak : null,
          icon: Icon(Icons.volume_up, color: colorScheme.onSecondary),
          label: Text('Leer texto', style: TextStyle(color: colorScheme.onSecondary)),
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.secondary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        ElevatedButton.icon(
          onPressed: isTextAvailable ? onStop : null,
          icon: Icon(Icons.stop, color: colorScheme.onError),
          label: Text('Detener lectura', style: TextStyle(color: colorScheme.onError)),
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.error,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
