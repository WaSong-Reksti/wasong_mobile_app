import 'package:wasong_mobile_app/models/course.dart';

class User{
  String about;
  String email;
  String name;
  String password;
  String type;
  String username;
  User(this.about, this.email, this.name, this.password, this.type, this.username);
}

class Instructor implements User{
  @override String about;
  @override String email;
  @override String name;
  @override String password;
  @override String type;
  @override String username;
  Instructor(this.about, this.email, this.name, this.password, this.type, this.username);
  factory Instructor.example(){
    return Instructor(
        "aaaaaaaaaaaa", 
        "najip@gmail.com", 
        "najip wibowo", 
        "passwordpeod", 
        "Instructor", 
        "asdfasdf"
    );
  }
}

class Student implements User{
  @override String about;
  @override String email;
  @override String name;
  @override String password;
  @override String type;
  @override String username;
  List<Course> courses;
  Student(this.about, this.email, this.name, this.password, this.type, this.username, this.courses);
  factory Student.example(){
    return Student(
      "asdfasdf\nasdfasdfasdfa\nasdfasdfasdfasdf\naaaaaaaaaaaaaaaaaaaaaaaaaaa\ngalvanized square steel\nscrews from aunt\neco-friendly wood veneer\nduar\n1x1 m^2 meter apartment",
      "ivan@gmail.com", 
      "ivan nigga", 
      "passwordnigga", 
      "Student", 
      "ivaniga",
      [Course.example(),Course.example(),Course.example(),Course.example()]
    );
  }
}