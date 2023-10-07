import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:getxstudy/screens/home.dart';

void main() {
  runApp(const Getx());
    
}
class Getx extends StatelessWidget {
  const Getx({super.key});
  @override

  Widget build(BuildContext context) {
    
    return GetMaterialApp(
      debugShowCheckedModeBanner: false ,
      home:Home()
    );   
    

  }
}