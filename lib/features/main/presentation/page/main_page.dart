import 'package:find_food/features/main/presentation/controller/main_controller.dart';
import 'package:find_food/widgets/BottomNavigationBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: Get.nestedKey(1),
        initialRoute: "/home",
        onGenerateRoute: controller.onGenerateRoute,
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  _bottomNavigationBar() {
    return Obx(
      () => BottomNavigationBarWidget(
        currentIndex: controller.currentIndex.value,
        onPageChanged: (index) {
          controller.onChangeItemBottomBar(index);
        },
      ),
    );
  }
}