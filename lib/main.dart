import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/Home.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Task03",
      home: AppHome(),
      debugShowCheckedModeBanner: false,
      // color: Colors.white,
    );
  }
}
