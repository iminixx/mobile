import 'dart:io';

import 'package:get/get.dart';

class ImagePickerController extends GetxController {
  Rx<File?> _imageFile = Rx<File?>(null);
  List<File?> _imageHistory = [];

  File? get imageFile => _imageFile.value;
  List<File?> get imageHistory => _imageHistory;

  void setImage(File? file) {
    _imageFile.value = file;
    _imageHistory.add(file);
  }
}
