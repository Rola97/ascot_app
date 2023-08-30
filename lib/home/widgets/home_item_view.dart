// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ascot_app/home/models/home_data_response.dart';
import 'package:flutter/material.dart';

class HomeItemView extends StatelessWidget {
  final Data data;
  const HomeItemView({
    Key? key,
    required this.data,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: const EdgeInsets.only(bottom: 10, right: 20, left: 20),
      width: double.infinity,
      // height: 200,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
                color: Colors.black54, offset: Offset(0, 4), blurRadius: 10)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.nameEn ?? '',
            style: const TextStyle(
              color: Color(0xff282425),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(
            data.bodyEn ?? '',
            style: TextStyle(
              color: const Color(0xff282425).withOpacity(0.7),
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }
}
