import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/bottom_nav_bar.dart';

class AutomaticModePage extends StatefulWidget {
  const AutomaticModePage({super.key});

  @override
  State<AutomaticModePage> createState() => _AutomaticModePageState();
}

class _AutomaticModePageState extends State<AutomaticModePage> {
  late CameraController _cameraController;
  late TextRecognizer _textRecognizer;
  Timer? _timer;

  bool _initialized = false;
  String _detectedText = 'Apunta la cámara a texto';

  @override
  void initState() {
    super.initState();
    _setup();
  }

  Future<void> _setup() async {
    final cameras = await availableCameras();
    final back = cameras.firstWhere((c) => c.lensDirection == CameraLensDirection.back);
    _cameraController = CameraController(back, ResolutionPreset.medium, enableAudio: false);
    await _cameraController.initialize();
    await _cameraController.setFlashMode(FlashMode.off);

    _textRecognizer = TextRecognizer();

    // Cada segundo tomamos una foto y procesamos
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _captureAndProcess());

    setState(() => _initialized = true);
  }

  Future<void> _captureAndProcess() async {
    if (!_cameraController.value.isInitialized || _cameraController.value.isTakingPicture) return;

    try {
      final XFile file = await _cameraController.takePicture();
      final path = file.path;
      final inputImage = InputImage.fromFilePath(path);
      final result = await _textRecognizer.processImage(inputImage);
      final text = result.text.trim();
      if (text.isNotEmpty && text != _detectedText) {
        setState(() => _detectedText = text);
      }
      File(path).delete().catchError((_) => File(path));
    } catch (_) {
      // Ignora errores de toma de foto
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _cameraController.dispose();
    _textRecognizer.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Modo Automático'),
      body: !_initialized
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              fit: StackFit.expand,
              children: [
                CameraPreview(_cameraController),
                Positioned(
                  bottom: 24,
                  left: 16,
                  right: 16,
                  child: Container(
                    constraints: const BoxConstraints(maxHeight: 200),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: colorScheme.surface.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: colorScheme.primary.withValues(alpha: 0.8)),
                    ),
                    child: SingleChildScrollView(
                      child: Text(
                        _detectedText,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: colorScheme.onSurface,
                          fontSize: 25,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),
    );
  }
}
