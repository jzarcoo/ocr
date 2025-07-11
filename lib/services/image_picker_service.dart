import 'dart:io';
import 'package:image_picker/image_picker.dart';

abstract class ImagePickerService {
  Future<File?> pickFromGallery();
  Future<File?> pickFromCamera();
}

class ImagePickerServiceImpl implements ImagePickerService {
  final ImagePicker _picker = ImagePicker();

  @override
  Future<File?> pickFromGallery() async {
    final XFile? picked = await _picker.pickImage(source: ImageSource.gallery);
    return picked != null ? File(picked.path) : null;
  }

  @override
  Future<File?> pickFromCamera() async {
    final XFile? picked = await _picker.pickImage(source: ImageSource.camera);
    return picked != null ? File(picked.path) : null;
  }
}
