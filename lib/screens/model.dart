import 'package:get/get.dart';

class StudendModel {
  final name;
  final image;
  final age;

  StudendModel( this.name, this.image, this.age);
}

class MyController extends GetxController {
  List<StudendModel> studentList = [];

  addStudent(studentobj) {
    studentList.add(studentobj);
    update();
  }

  deleteStudent(index) {
    studentList.removeAt(index);
    update();
  }

  edit(int index, StudendModel studentObj) {
    studentList[index]=studentObj;
    update();
  }
}
