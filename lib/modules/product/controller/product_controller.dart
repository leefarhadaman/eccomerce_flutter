import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'dart:io';

class ProductController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseDatabase database = FirebaseDatabase.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  var isLoading = false.obs;
  var productList = [].obs;

  Future<void> addProduct(
      String name, double price, File image, String description) async {
    try {
      isLoading.value = true;

      // Upload image to Firebase Storage
      String imageUrl = await uploadImage(image);

      // Get current user
      User? user = auth.currentUser;

      if (user != null) {
        DatabaseReference productsRef = database.ref('products').push();
        await productsRef.set({
          'name': name,
          'price': price,
          'imageUrl': imageUrl,
          'description': description,
          'userId': user.uid,
        });

        isLoading.value = false;
        Get.snackbar('Success', 'Product added successfully');
      } else {
        isLoading.value = false;
        Get.snackbar('Error', 'User not authenticated');
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', e.toString());
    }
  }

  Future<String> uploadImage(File image) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference reference = storage.ref().child('product_images/$fileName');
      UploadTask uploadTask = reference.putFile(image);
      TaskSnapshot snapshot = await uploadTask;
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      Get.snackbar('Error', 'Failed to upload image: $e');
      return '';
    }
  }

  void fetchProducts() async {
    try {
      DatabaseReference productsRef = database.ref('products');
      productsRef.onValue.listen((DatabaseEvent event) {
        if (event.snapshot.value != null) {
          productList.clear();
          Map<dynamic, dynamic> products =
              event.snapshot.value as Map<dynamic, dynamic>;
          products.forEach((key, value) {
            productList.add(value);
          });
        }
      });
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch products: $e');
    }
  }
}
