import 'package:ascot_app/form/views/form_view.dart';
import 'package:ascot_app/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/home_item_view.dart';

// ignore: must_be_immutable
class HomeView extends StatefulWidget {
  HomeControler homeControler = Get.put(HomeControler());
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: Container(),
            centerTitle: true,
            title: const Text(
              'Home Page',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () {
                  Get.to(() => FormView());
                },
              )
            ],
            backgroundColor: const Color(0xFF152F4B)),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: StreamBuilder<Object>(
              stream: widget.homeControler.homeDataList.stream,
              builder: (context, snapshot) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: widget.homeControler.homeDataList.length,
                  itemBuilder: (context, index) => HomeItemView(
                    data: widget.homeControler.homeDataList[index],
                  ),
                );
              }),
        ));
  }

  @override
  void initState() {
    super.initState();
    widget.homeControler.fetchAllData();
  }
}
