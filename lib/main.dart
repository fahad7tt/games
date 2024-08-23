import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui/controller/users_controller.dart';
import 'package:ui/view/screens/home_screen.dart';

void main() {
  Get.put(UserController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
