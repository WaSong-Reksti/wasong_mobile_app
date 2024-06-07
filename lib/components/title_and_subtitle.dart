import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleAndSubtitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const TitleAndSubtitle(
      {Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            title,
            style: GoogleFonts.rubik(fontWeight: FontWeight.bold, fontSize: 22),
          ),
        ),
        Container(
          height: 10,
          decoration: const BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: Colors.black, width: 1.0))),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            subtitle,
            style: GoogleFonts.rubik(fontSize: 15),
          ),
        ),
      ],
    );
  }
}
