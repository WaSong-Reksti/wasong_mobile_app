import 'package:wasong_mobile_app/models/course.dart';

class Meeting{
  Course course;
  DateTime datetime;
  String description;
  String name;
  String url;
  Meeting(this.course, this.datetime, this.description, this.name, this.url);
}