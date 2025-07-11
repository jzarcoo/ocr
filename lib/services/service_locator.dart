import 'package:get_it/get_it.dart';
import 'image_picker_service.dart';
import 'text_recognition_service.dart';
import 'text_to_speech_service.dart';

final GetIt locator = GetIt.instance;

void setupServiceLocator() {
	locator.registerLazySingleton<ImagePickerService>(() => ImagePickerServiceImpl());
	locator.registerLazySingleton<TextRecognitionService>(() => TextRecognitionServiceImpl());
	locator.registerLazySingleton<TextToSpeechService>(() => TextToSpeechServiceImpl());
}