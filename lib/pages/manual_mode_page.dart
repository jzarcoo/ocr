import 'dart:io';
import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/manual_mode/camera_placeholder.dart';
import '../widgets/manual_mode/image_source_buttons.dart';
import '../widgets/manual_mode/control_buttons.dart';
import '../../controllers/manual_mode_controller.dart';

class ManualModePage extends StatefulWidget {
  const ManualModePage({super.key});

  @override
  State<ManualModePage> createState() => _ManualModePageState();
}

class _ManualModePageState extends State<ManualModePage> {
  final ManualModeController _controller = ManualModeController();
  File? _imageFile;
  String _recognizedText = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Modo Manual'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CameraPlaceholder(image: _imageFile),
              const SizedBox(height: 24),
              ImageSourceButtons(
                onCameraTap: () {
                  _controller.pickFromCamera(
                    onImage: (file) => setState(() => _imageFile = file),
                    onText: (txt) => setState(() => _recognizedText = txt),
                  );
                },
                onGalleryTap: () {
                  _controller.pickFromGallery(
                    onImage: (file) => setState(() => _imageFile = file),
                    onText: (txt) => setState(() => _recognizedText = txt),
                  );
                },
              ),
              const SizedBox(height: 16),
              Text(
                _recognizedText.isEmpty
                    ? 'No se detectó texto.'
                    : _recognizedText,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: colorScheme.onSurface,
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              ControlButtons(
                isTextAvailable: _recognizedText.isNotEmpty,
                onSpeak: _controller.speakText,
                onStop: _controller.stopCapture,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 0),
    );
  }
}
