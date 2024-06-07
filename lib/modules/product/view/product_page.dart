import 'dart:io';
import 'package:devfaru_eccomerce/modules/product/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProductPage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  final Rx<File?> _image = Rx<File?>(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Product')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Product Name'),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 10),
            Obx(() => _image.value == null
                ? Text('No image selected.')
                : Image.file(_image.value!, height: 150)),
            ElevatedButton(
              onPressed: () async {
                final pickedFile =
                    await _picker.pickImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  _image.value = File(pickedFile.path);
                }
              },
              child: Text('Pick Image'),
            ),
            SizedBox(height: 20),
            Obx(() {
              return productController.isLoading.value
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        if (nameController.text.isNotEmpty &&
                            priceController.text.isNotEmpty &&
                            descriptionController.text.isNotEmpty &&
                            _image.value != null) {
                          productController.addProduct(
                            nameController.text,
                            double.parse(priceController.text),
                            _image.value!,
                            descriptionController.text,
                          );
                        } else {
                          Get.snackbar('Error', 'All fields are required');
                        }
                      },
                      child: Text('Add Product'),
                    );
            }),
          ],
        ),
      ),
    );
  }
}
