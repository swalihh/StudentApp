import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxstudy/screens/model.dart';
import 'package:getxstudy/screens/pagetwo.dart';
import 'package:getxstudy/screens/view.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({super.key});

  RxBool isDarkMode =
      false.obs; // Define a reactive boolean to track the theme state

  final homeController = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('ADD DATA'),
        onPressed: () {
          Get.to(Pagetwo());
        },
      
      ),
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          Obx(
            () => Switch(
              value: isDarkMode.value,
              onChanged: (value) {
                isDarkMode.value = value;
                Get.changeTheme(value ? ThemeData.dark() : ThemeData.light());
              },
            ),
          ),
        ],
      ),
      body: GetBuilder<MyController>(
        builder: (controller) {
          final studentList = controller.studentList;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: controller.studentList.length,
            itemBuilder: (context, index) {
              final studentData = homeController.studentList[index];
              return InkWell(
                onTap: () {
                  Get.to( Show(studentIndex: index,));
                },
                child: Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: FileImage(File(studentData.image)),
                    ),
                    title: Text(studentData.name),
                    subtitle: Text(studentData.age),
                    trailing: PopupMenuButton(
                      onSelected: (Value){
                        if(Value=='Edit'){
                          Get.to(Pagetwo(
                        index: index,studentData: studentData,isEdit: true,
                          ));
              
                        }else if(Value == 'Delete'){
                            controller.deleteStudent(index);
                        }
                      }
                          ,
                      itemBuilder: (context) {
                        return [
                          const PopupMenuItem(
                            value: 'Edit',
                            child: Text('Edit'),
                          ),
                          const PopupMenuItem(value: 'Delete',child: Text('Delete'),),
                        ];
                      },
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
