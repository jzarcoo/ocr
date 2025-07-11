import 'dart:io';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

abstract class TextRecognitionService {
	Future<String> recognizeText(File imageFile);
	void dispose();
}

class TextRecognitionServiceImpl implements TextRecognitionService {
	final TextRecognizer _recognizer = TextRecognizer(script: TextRecognitionScript.latin);

	@override
	Future<String> recognizeText(File imageFile) async {
		final input = InputImage.fromFile(imageFile);
		final RecognizedText result = await _recognizer.processImage(input);
		return result.text;
	}

	@override
	void dispose() {
		_recognizer.close();
	}
}