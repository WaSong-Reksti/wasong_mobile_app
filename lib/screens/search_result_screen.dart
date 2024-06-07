import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wasong_mobile_app/screens/class_detail_screen.dart';

class SearchResultScreen extends StatelessWidget {
  final String query;
  const SearchResultScreen({Key? key, required this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search Result for \"$query\"",
          style: GoogleFonts.rubik(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        backgroundColor: const Color.fromRGBO(253, 248, 238, 1),
        shadowColor: const Color.fromRGBO(51, 51, 51, 0.5),
        elevation: 2.0,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: AspectRatio(
              aspectRatio: 1.0,
              child: Image.network(
                "https://static.miraheze.org/bluearchivewiki/thumb/c/ca/Yoshimi_%28Band%29.png/399px-Yoshimi_%28Band%29.png",
                fit: BoxFit.cover,
              ),
            ),
            title: Text('Result $index'), // Replace with actual data
            subtitle: Text('Description for result $index'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ClassDetailScreen(classInfo: {
                  "imageUrl":
                      "https://static.miraheze.org/bluearchivewiki/thumb/c/ca/Yoshimi_%28Band%29.png/399px-Yoshimi_%28Band%29.png"
                });
              }));
            },
          );
        },
        scrollDirection: Axis.vertical,
      ),
    );
  }
}
