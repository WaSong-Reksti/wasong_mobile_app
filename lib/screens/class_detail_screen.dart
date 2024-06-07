import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wasong_mobile_app/components/title_and_subtitle.dart';
import 'package:wasong_mobile_app/themes/color_themes.dart';

class ClassDetailScreen extends StatelessWidget {
  final Map<String, dynamic>? classInfo;
  ClassDetailScreen({Key? key, required this.classInfo}) : super(key: key);

  final Map<String, dynamic> _placeholder = {
    "imageUrl":
        "https://upload.wikimedia.org/wikipedia/id/9/95/Logo_Institut_Teknologi_Bandung.png",
    "title": "Horas",
    "description": "GALVANIZED SQUARED STEEL",
    "instrument": "Mayones",
    "instructor": "Mang",
    "schedule": "Kumaha Anjeun",
  };
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
          child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Container(
            color: Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: Image.network(
                          classInfo != null
                              ? classInfo!["imageUrl"]
                              : _placeholder["imageUrl"],
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              classInfo?["title"] ?? _placeholder["title"],
                              style: GoogleFonts.rubik(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(
                              classInfo?["instructor"] ??
                                  _placeholder["instructor"],
                              style: GoogleFonts.rubik(fontSize: 15),
                            ),
                            Text(
                              classInfo?["instrument"] ??
                                  _placeholder["instrument"],
                              style: GoogleFonts.rubik(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TitleAndSubtitle(
                      title: "Description",
                      subtitle: classInfo?["description"] ??
                          _placeholder["description"]),
                  const SizedBox(
                    height: 25,
                  ),
                  TitleAndSubtitle(
                      title: "Schedule",
                      subtitle:
                          classInfo?["schedule"] ?? _placeholder["schedule"]),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0))),
                            shadowColor: WidgetStateProperty.all(Colors.black),
                            backgroundColor: WidgetStateProperty.all(
                                WasongColorThemes.yellowPale)),
                        onPressed: () {},
                        child: Text(
                          "Enroll",
                          style: GoogleFonts.rubik(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
