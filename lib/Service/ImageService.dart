import 'dart:io';
import 'dart:math';
import 'package:image_picker/image_picker.dart';

class ImageService{
  final picker = ImagePicker();

  Future<File?> pickFromGallery() async {
    final file = await picker.pickImage(source: ImageSource.gallery);

    // ? -> ha bo'sa // : -> yo'q bo'lsa (else)
    return file == null ? null : File(file.path);
  }

  Future<File?> pickFromCamera() async {
    final file = await picker.pickImage(source: ImageSource.camera);

    return file == null ? null : File(file.path);
  }
}