// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  final String title;
  final String hintText;
  Color? titleColor;

  Widget? suffixIcon;
  Widget? prefixIcon;
  TextInputType? keyboardType;
  List<TextInputFormatter>? inputFormatters;
  bool? isRequired;
  TextEditingController? controller;
  Function(String)? onChanged;
  bool? obscureText;
  FontWeight? fontWeight;
  bool? enabled;
  bool? readOnly;
  CustomTextField(
      {Key? key,
      required this.title,
      required this.hintText,
      this.suffixIcon,
      this.inputFormatters,
      this.isRequired,
      this.prefixIcon,
      this.controller,
      this.onChanged,
      this.keyboardType,
      this.obscureText,
      this.titleColor,
      this.enabled,
      this.fontWeight,
      this.readOnly})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 3),
            child: Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: titleColor ?? const Color(0xFF152F4B),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                isRequired == true
                    ? Text(
                        '*',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: fontWeight ?? FontWeight.w900,
                          fontSize: 15,
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              bottom: 5,
              left: 20,
            ),
            width: double.infinity,
            height: 48,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xffC7C9D9))),
            child: TextField(
              readOnly: readOnly ?? false,
              enableInteractiveSelection: true,
              obscureText: obscureText ?? false,
              keyboardType: keyboardType,
              onChanged: onChanged,
              controller: controller,
              textAlign: TextAlign.justify,
              inputFormatters: inputFormatters,
              decoration: InputDecoration(
                  enabled: enabled ?? true,
                  prefixIcon: prefixIcon,
                  prefixIconConstraints: const BoxConstraints(minWidth: 55),
                  suffixIcon: suffixIcon,
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: const TextStyle(
                    color: Colors.black26,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
