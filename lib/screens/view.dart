import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxstudy/screens/model.dart';

class Show extends StatelessWidget {
  final int studentIndex; 
   Show({super.key, required this.studentIndex}); 

  final homeController = Get.find<MyController>();


  @override
  Widget build(BuildContext context) {
    final student = homeController.studentList[studentIndex]; 
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Center(
        child: Container(
          color:const Color.fromARGB(255, 66, 94, 100),
          height: 400,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: FileImage(File(student.image)),
              ),
              Text(
             "Name: ${ student.name}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                'Age: ${student.age}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
