import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:comic/image_picker_controller.dart';

class ProfilePage extends StatelessWidget {
  final ImagePickerController imagePickerController = Get.put(ImagePickerController());
  final _imagePicker = ImagePicker();

  void _selectImage(ImageSource source) async {
    final pickedFile = await _imagePicker.getImage(source: source);
    if (pickedFile != null) {
      imagePickerController.setImage(File(pickedFile.path));
    } else {
      Get.snackbar(
        'Error',
        'No image selected.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              final imageFile = imagePickerController.imageFile;
              if (imageFile != null) {
                return CircleAvatar(
                  radius: 50,
                  backgroundImage: FileImage(imageFile),
                );
              } else {
                return CircleAvatar(
                  radius: 50,
                  child: Icon(Icons.person),
                );
              }
            }),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectImage(ImageSource.gallery),
              child: Text('Pick Image from Gallery'),
            ),
            ElevatedButton(
              onPressed: () => _selectImage(ImageSource.camera),
              child: Text('Take Picture'),
            ),
          ],
        ),
      ),
    );
  }
}
