import 'package:devfaru_eccomerce/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseDatabase database = FirebaseDatabase.instance;

  var isSignedIn = false.obs;
  var isLoading = false.obs;

  void signUp(String email, String password) async {
    try {
      isLoading.value = true;
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // Save user info in Realtime Database
      await database.ref('users/${userCredential.user!.uid}').set({
        'email': email,
        'created_at': DateTime.now().toIso8601String(),
      });
      isLoading.value = false;
      isSignedIn.value = true;
      Get.snackbar('Success', 'User registered successfully');
      Get.offNamed(AppRoutes.DASHBOARD);
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', e.toString());
    }
  }

  void login(String email, String password) async {
    try {
      isLoading.value = true;
      await auth.signInWithEmailAndPassword(email: email, password: password);
      isLoading.value = false;
      isSignedIn.value = true;
      Get.snackbar('Success', 'User logged in successfully');
      Get.offNamed(AppRoutes.DASHBOARD);

    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', e.toString());
    }
  }

  void signOut() async {
    await auth.signOut();
    isSignedIn.value = false;
  }
}
