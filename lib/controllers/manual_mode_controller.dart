import 'dart:io';

import '../services/image_picker_service.dart';
import '../services/text_recognition_service.dart';
import '../services/text_to_speech_service.dart';
import '../services/service_locator.dart';

class ManualModeController {
  final ImagePickerService _imageService = locator<ImagePickerService>();
  final TextRecognitionService _textService = locator<TextRecognitionService>();
  final TextToSpeechService _ttsService = locator<TextToSpeechService>();

  File? imageFile;
  String recognizedText = '';

  void speakText() {
    if (recognizedText.isNotEmpty) {
      _ttsService.speak(recognizedText);
    } else {
      _ttsService.speak('No hay texto reconocido para leer.');
    }
  }

  void stopCapture() {
    _ttsService.stop();
  }

  void dispose() {
    _textService.dispose();
    _ttsService.stop();
  }

  Future<void> pickFromCamera({
    required Function(File) onImage,
    required Function(String) onText,
  }) async {
    final file = await _imageService.pickFromCamera();
    await _handleImage(file, onImage, onText);
  }

  Future<void> pickFromGallery({
    required Function(File) onImage,
    required Function(String) onText,
  }) async {
    final file = await _imageService.pickFromGallery();
    await _handleImage(file, onImage, onText);
  }

  Future<void> _handleImage(
    File? file,
    Function(File) onImage,
    Function(String) onText,
  ) async {
    if (file != null) {
      onImage(file);

      final text = await _textService.recognizeText(file);
      recognizedText = text.isNotEmpty ? text : 'No se detectó texto.';
      onText(recognizedText);

      _ttsService.speak(recognizedText);
    }
  }
}
