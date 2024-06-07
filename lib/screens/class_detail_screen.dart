import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wasong_mobile_app/themes/color_themes.dart';

class ClassDetailScreen extends StatelessWidget {
  final Map<String, dynamic>? classInfo;
  const ClassDetailScreen({Key? key, this.classInfo}) : super(key: key);

  final String _placeholderImageUrl =
      "https://upload.wikimedia.org/wikipedia/id/9/95/Logo_Institut_Teknologi_Bandung.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Class Detail',
          style: GoogleFonts.rubik(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromRGBO(253, 248, 238, 1),
        shadowColor: const Color.fromRGBO(51, 51, 51, 0.5),
        elevation: 2.0,
      ),
      backgroundColor: WasongColorThemes.yellowPale,
      body: SafeArea(
          child: Container(
        color: WasongColorThemes.yellowPale,
        child: Column(
          children: [
            Image.network(
              classInfo != null ? classInfo!["imageUrl"] : _placeholderImageUrl,
            )
          ],
        ),
      )),
    );
  }
}
