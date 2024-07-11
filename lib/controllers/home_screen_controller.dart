import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lilian_tech_task/view/tabs/home_tab.dart';

class HomeScreenController extends GetxController{
  List<Widget> allViews = [
    const HomeTab(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];
  final RxInt _activeTab = RxInt(0);

  int get activeTab => _activeTab.value;

  void onNavTapped(int i){
    _activeTab.value = i;
  }
}