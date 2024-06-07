import 'package:devfaru_eccomerce/modules/authentication/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthPage extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Authentication')),
      body: Obx(() {
        if (authController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (authController.isSignedIn.value) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Signed In'),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: authController.signOut,
                  child: Text('Sign Out'),
                ),
              ],
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  authController.login(
                    emailController.text,
                    passwordController.text,
                  );
                },
                child: Text('Login'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  authController.signUp(
                    emailController.text,
                    passwordController.text,
                  );
                },
                child: Text('Sign Up'),
              ),
            ],
          ),
        );
      }),
    );
  }
}
