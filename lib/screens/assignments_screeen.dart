import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wasong_mobile_app/models/assignment.dart';
import 'package:wasong_mobile_app/screens/assignment_detail_screen.dart';
import 'package:wasong_mobile_app/themes/color_themes.dart';

class AssignmentsScreen extends StatefulWidget {
  const AssignmentsScreen({Key? key}) : super(key: key);

  @override
  State<AssignmentsScreen> createState() => _AssignmentsScreenState();
}

class _AssignmentsScreenState extends State<AssignmentsScreen> {
  final List<Assignment> assignments = [
    Assignment(
        "Sweet Child O'Mine", "Mainkan intro Sweet Child O'Mine", "2029", true),
    Assignment(
        "Tugas 1 - Skibidi Toilet", "Skibidi Toilet in Cmajor7", "2029", true),
    Assignment("Tugas 69 - Ibu Kita Kartini",
        "Mainkan Ibu kita kartini pakai kaki, sampe jago", "2030", false)
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  _selectedIndex = 0;
                });
                if (kDebugMode) {
                  print("Berlangsung tapped");
                }
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 2.5,
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(
                      color: _selectedIndex == 0
                          ? WasongColorThemes.orange
                          : Colors.black,
                      width: 1.0),
                )),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Ongoing",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: _selectedIndex == 0
                            ? WasongColorThemes.orange
                            : Colors.black),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _selectedIndex = 1;
                });
                if (kDebugMode) {
                  print("Selesai tapped");
                }
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 2.5,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: _selectedIndex == 1
                                ? WasongColorThemes.orange
                                : Colors.black,
                            width: 1.0))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Done",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: _selectedIndex == 1
                            ? WasongColorThemes.orange
                            : Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: assignments.length,
            itemBuilder: (context, index) {
              final item = assignments[index];
              if ((_selectedIndex == 0 && item.done) ||
                  (_selectedIndex == 1 && !item.done)) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AssignmentDetailScreen(assignment: item);
                    }));
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 12.0),
                    padding: const EdgeInsets.all(16.0),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(item.description),
                        const SizedBox(height: 8),
                        Text('Deadline: ${item.deadline}'),
                      ],
                    ),
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ],
    );
  }
}
