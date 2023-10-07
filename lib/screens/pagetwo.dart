import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxstudy/screens/model.dart';
import 'package:image_picker/image_picker.dart';

class Pagetwo extends StatelessWidget {
  bool? isEdit = false;
  final studentData;
  final index;

  Pagetwo({super.key, this.studentData, this. index, this.isEdit});

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  final addController = Get.put(MyController());

  var image = ''.obs;
  @override
  Widget build(BuildContext context) {
    if (isEdit == true) {
      final name = studentData.name;
      final age = studentData.age;
      final imagepath = studentData.image;
      nameController.text = name;
      ageController.text = age;
      image.value = imagepath;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit == true ? 'edit' : 'add'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                pickImage();
              },
              child: Obx(
                () => CircleAvatar(
                    radius: 50,
                    backgroundImage: image.value == ''
                        ? const AssetImage('lib/images/bg.png')
                        : FileImage(File(image.value)) as ImageProvider),
              ),
            ),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'name',
              ),
            ),
            TextFormField(
              controller: ageController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'age',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  isEdit == true
                      ?editStudentDatas(index) 
                      : addStudentDatas();
                },
                child: Text(isEdit == true ? 'Update' : 'add')),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  addStudentDatas() {
    if (image != '') {
      final name = nameController.text.trim();
      final age = ageController.text.trim();
      if (name.isNotEmpty && age.isNotEmpty) {
        final studentObj = StudendModel(name, image.toString(), age);
        addController.addStudent(studentObj);
        Get.back();
      }
    }
  }

  editStudentDatas(index) {
    if (image != '') {
      final name = nameController.text.trim();
      final age = ageController.text.trim();
      if (name.isNotEmpty && age.isNotEmpty) {
        final studentObj = StudendModel(name, image.toString(), age);
        addController.edit(index, studentObj);
        Get.back();
      }
    }
  }

  pickImage() async {
    final images = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (images != null) {
      image.value = images.path;
    }
  }
}
