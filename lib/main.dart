import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:lilian_tech_task/bindings/cobone_details_screen_bindings.dart';
import 'package:lilian_tech_task/bindings/home_screen_bindings.dart';
import 'package:lilian_tech_task/ui/theme.dart';
import 'package:lilian_tech_task/view/cobone_details_screen.dart';
import 'package:lilian_tech_task/view/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: lightTheme,
      getPages: [
        GetPage(name: "/", page: () => const HomeScreen(),binding: HomeScreenBindings(),),
        GetPage(name: "/cobone-details", page: () => const CoboneDetailsScreen(),binding: CoboneDetailsScreenBindings(),),
      ],
    );
  }
}

