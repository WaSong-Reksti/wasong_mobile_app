import 'package:wasong_mobile_app/models/user.dart';

class Course{
  String description;
  String instrument;
  String name;
  Instructor instructor;
  Course(this.description, this.instrument, this.name, this.instructor);
  factory Course.example(){
    return Course(
      "kelas buat belajar main gitar", 
      "Gitar", 
      "Kelas Gitar", 
      Instructor.example()
    );
  }
}