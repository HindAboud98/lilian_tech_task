import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:lilian_tech_task/controllers/home_screen_controller.dart';
import 'package:lilian_tech_task/ui/theme.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: controller.allViews[controller.activeTab],
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: NotchBottomBarController(index: controller.activeTab),
        bottomBarItems: [
          BottomBarItem(
              inActiveItem: const Icon(IconlyBroken.home),
              activeItem: Icon(IconlyBroken.home,color: secondaryColor,)),
          BottomBarItem(
              inActiveItem: const Icon(IconlyBroken.document),
              activeItem: Icon(IconlyBroken.document,color: secondaryColor,)),
          BottomBarItem(
              inActiveItem: const Icon(IconlyBroken.paper_fail),
              activeItem: Icon(IconlyBroken.paper_fail,color: secondaryColor,)),
          BottomBarItem(
              inActiveItem: const Icon(IconlyBroken.category),
              activeItem: Icon(IconlyBroken.category,color: secondaryColor,)),
          BottomBarItem(
              inActiveItem: const Icon(IconlyBroken.profile),
              activeItem: Icon(IconlyBroken.profile,color: secondaryColor,)),
        ],
        onTap: controller.onNavTapped,
        kIconSize: 25,
        kBottomRadius: 22,),
    ),);
  }
}
