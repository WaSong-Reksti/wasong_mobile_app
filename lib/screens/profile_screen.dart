import 'package:flutter/material.dart';
import 'package:wasong_mobile_app/models/user.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool showAll = false;
  Student exampleStudent = Student.example();
  String imageUrl= "https://static.miraheze.org/bluearchivewiki/thumb/9/90/Natsu.png/399px-Natsu.png";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 2),
                          color: Color.fromARGB(90, 0, 0, 0),
                          blurRadius: 4,
                          spreadRadius: 2,
                        )
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(8.0)),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ),
                ),
                const Padding(padding: EdgeInsets.only(left: 8.0)),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.width / 2, // Ensuring the container height matches the image size
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(padding: EdgeInsets.only(top: 8.0)),
                        Text(
                          exampleStudent.name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          exampleStudent.username,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    )
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 8.0)),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.black54),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 2),
                    color: Color.fromARGB(90, 0, 0, 0),
                    blurRadius: 4,
                    spreadRadius: 2,
                  )
                ],
              ),
              constraints: const BoxConstraints(minHeight: 250),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "About",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    exampleStudent.about,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              )
            ),
            const Padding(padding: EdgeInsets.only(top: 24.0)),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.black54),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 2),
                    color: Color.fromARGB(90, 0, 0, 0),
                    blurRadius: 4,
                    spreadRadius: 2,
                  )
                ],
              ),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Classes",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if(exampleStudent.courses.isEmpty)
                    const ListTile(
                      title: Text('No classes found'),
                    )
                    else
                    ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: <Widget>[
                      for (int i = 0; i < (showAll ? exampleStudent.courses.length : (exampleStudent.courses.length > 2 ? 2 : exampleStudent.courses.length)); i++)
                        ListTile(
                          contentPadding: const EdgeInsets.all(8.0),
                          leading: AspectRatio(
                            aspectRatio: 1.0,
                            child: Image.network(imageUrl, fit: BoxFit.cover)//exampleStudent.courses[i].imageUrl)
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [Text(exampleStudent.courses[i].name)],
                          )
                        ),
                      ],
                    ),
                  if (exampleStudent.courses.length > 2)
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          showAll = !showAll;
                        });
                      },
                      child: Text(showAll ? 'View Less' : 'View More'),
                    ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}