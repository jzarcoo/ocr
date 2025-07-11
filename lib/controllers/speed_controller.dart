import 'package:flutter/material.dart';
import '../services/service_locator.dart';
import '../services/text_to_speech_service.dart';
import '../models/speed_option.dart';

class SpeedController {
  final TextToSpeechService _tts = locator<TextToSpeechService>();

  final List<SpeedOption> options = const [
    SpeedOption(label: 'Rápido', rate: 0.8),
    SpeedOption(label: 'Medio', rate: 0.5),
    SpeedOption(label: 'Lento', rate: 0.3),
  ];

  void setSpeed(SpeedOption option, BuildContext context) {
    _tts.setSpeechRate(option.rate);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Velocidad ajustada a ${option.label}')),
    );
  }
}
