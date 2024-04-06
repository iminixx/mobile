import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'image_picker_controller.dart';

class FavoritePage extends StatelessWidget {
  final ImagePickerController imagePickerController = Get.put(ImagePickerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Image History:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: GetBuilder<ImagePickerController>(
                builder: (controller) {
                  final imageHistory = controller.imageHistory;
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1, // Mengatur aspek rasio kotak menjadi 1:1
                    ),
                    itemCount: imageHistory.length,
                    itemBuilder: (context, index) {
                      final imageFile = imageHistory[index];
                      return Container(
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: imageFile != null
                              ? Image.file(imageFile, fit: BoxFit.cover)
                              : Icon(Icons.person, size: 50),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
