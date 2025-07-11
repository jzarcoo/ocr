import 'package:flutter/material.dart';

class ImageSourceButtons extends StatelessWidget {
  final VoidCallback onCameraTap;
  final VoidCallback onGalleryTap;

  const ImageSourceButtons({
    super.key,
    required this.onCameraTap,
    required this.onGalleryTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          onPressed: onCameraTap,
          icon: Icon(Icons.camera_alt, color: colorScheme.onPrimary),
          label: Text('Cámara', style: TextStyle(color: colorScheme.onPrimary)),
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        ElevatedButton.icon(
          onPressed: onGalleryTap,
          icon: Icon(Icons.photo, color: colorScheme.onSecondary),
          label: Text('Galería', style: TextStyle(color: colorScheme.onSecondary)),
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.secondary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
