import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';
import '../widgets/custom_text_field.dart';

// ignore: must_be_immutable
class LoginView extends StatelessWidget {
  LoginController loginController = Get.put(LoginController());
  LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Login'.tr,
            style: const TextStyle(
              color: Color(0xFF152F4B),
              fontWeight: FontWeight.bold,
              fontSize: 33,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          CustomTextField(
            onChanged: (p0) {
              loginController.checkLoginFormValidation();
            },
            controller: loginController.emailController,
            keyboardType: TextInputType.emailAddress,
            title: 'Email',
            hintText: 'Enter you email',
            isRequired: true,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            onChanged: (p0) {
              loginController.checkLoginFormValidation();
            },
            controller: loginController.passwordController,
            title: 'Password',
            hintText: 'Enter you password',
            isRequired: true,
          ),
          const SizedBox(
            height: 20,
          ),
          StreamBuilder<Object>(
              stream: loginController.isValidForm.stream,
              builder: (context, snapshot) {
                return GestureDetector(
                  onTap: () {
                    if (loginController.isValidForm.isTrue) {
                      loginController.login();
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: 48,
                    decoration: BoxDecoration(
                        color: loginController.isValidForm.isTrue
                            ? const Color(0xFF152F4B)
                            : const Color(0xFFE3E3E3),
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Login',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              })
        ]),
      ),
    );
  }
}
