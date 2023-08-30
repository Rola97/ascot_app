import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../login/widgets/custom_text_field.dart';
import '../controller/form_controller.dart';

// ignore: must_be_immutable
class FormView extends StatelessWidget {
  FormController formController = Get.put(FormController());
  FormView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              )),
          centerTitle: true,
          title: const Text(
            'Form Page',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          backgroundColor: const Color(0xFF152F4B)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              onChanged: (p0) {
                formController.formValidation();
              },
              title: 'Name',
              hintText: 'name',
              controller: formController.nameController,
            ),
            CustomTextField(
              onChanged: (p0) {
                formController.formValidation();
              },
              title: 'Contact',
              hintText: 'contact',
              controller: formController.contactController,
            ),
            CustomTextField(
              onChanged: (p0) {
                formController.formValidation();
              },
              title: 'Message',
              hintText: 'message',
              controller: formController.msgController,
            ),
            const SizedBox(
              height: 20,
            ),
            StreamBuilder<Object>(
                stream: formController.isValidForm.stream,
                builder: (context, snapshot) {
                  return GestureDetector(
                    onTap: () {
                      if (formController.isValidForm.isTrue) {
                        formController.addForm();
                      } else {
                        Get.snackbar('Error!', 'Please fill in this form first',
                            messageText: const Text(
                              'Please fill in this form first',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 15),
                            ),
                            snackPosition: SnackPosition.BOTTOM,
                            margin: const EdgeInsets.fromLTRB(20, 0, 20, 20));
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: 48,
                      decoration: BoxDecoration(
                          color: formController.isValidForm.isTrue
                              ? const Color(0xFF152F4B)
                              : const Color(0xFFE3E3E3),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Submit',
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
          ],
        ),
      ),
    );
  }
}
