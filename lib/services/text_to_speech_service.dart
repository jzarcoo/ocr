import 'package:flutter_tts/flutter_tts.dart';

abstract class TextToSpeechService {
  Future<void> speak(String text);
  void stop();
  void setSpeechRate(double rate);
}

class TextToSpeechServiceImpl implements TextToSpeechService {
  final FlutterTts _tts = FlutterTts();

  TextToSpeechServiceImpl() {
    _tts.setLanguage('es-ES');
    _tts.setSpeechRate(0.5); // valor por defecto
  }

  @override
  Future<void> speak(String text) async {
    await _tts.speak(text);
  }

  @override
  void stop() async {
    await _tts.stop();
  }

  @override
  void setSpeechRate(double rate) {
    _tts.setSpeechRate(rate);
  }
}
