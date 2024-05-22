import 'package:flutter/material.dart';

class AssignmentsScreen extends StatelessWidget {
  AssignmentsScreen({Key? key}) : super(key: key);

  final List<Assignment> assignments = [
    Assignment("Jokowi", "3 Periode", "2029"),
    Assignment("Prabowo", "Makan Siang Gratis", "2029"),
    Assignment("Heru Budi", "Jakarta Tenggelam 2030", "2030")
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: assignments.length,
      itemBuilder: (context, index) {
        final item = assignments[index];
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
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
        );
      },
    );
  }
}

class Assignment {
  String title;
  String description;
  String deadline;

  Assignment(this.title, this.description, this.deadline);
}
