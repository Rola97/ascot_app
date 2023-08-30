import 'package:ascot_app/core/auth_repo.dart';
import 'package:ascot_app/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthRepository authRepository = AuthRepository();
  RxBool isValidForm = false.obs;

  void checkLoginFormValidation() {
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    isValidForm.value = RegExp(pattern).hasMatch(emailController.text) &&
       passwordController.text.length >= 6;
  }

  void login() {
    authRepository
        .logInWithEmailAndPassword(
      emailController.text,
      passwordController.text,
    )
        .then(
      (value) {
        Get.to(() => HomeView());
      },
    ).onError(
      (error, stackTrace) {
        Get.snackbar('Invalid Email or Password', 'Please try again',
            messageText: const Text(
              'Please try again',
              style: TextStyle(color: Colors.black54, fontSize: 15),
            ),
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 20));
      },
    );
  }
}
