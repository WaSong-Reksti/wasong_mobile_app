import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wasong_mobile_app/navigations/main_navigations.dart';
import 'package:wasong_mobile_app/themes/color_themes.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LandingScreen1 extends StatelessWidget {
  const LandingScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Container(
            color: WasongColorThemes.yellowPale,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Image.asset("images/decor/logo.png"),
                      Stack(children: [
                        Material(
                          color: Colors.transparent,
                          child: Center(
                              child: SvgPicture.asset(
                            'images/decor/baumkuhen.svg',
                            semanticsLabel: 'My SVG Image',
                          )),
                        ),
                        Center(
                            child:
                                Image.asset("images/decor/landing_page_1.png"))
                      ]),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 16.0),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(text: '', children: [
                        TextSpan(
                          text: "Release",
                          style: GoogleFonts.rubik(
                              color: Colors.black,
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: " your inner music",
                          style: GoogleFonts.rubik(
                              color: Colors.black, fontSize: 32.0),
                        )
                      ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 0.0, horizontal: 20.0),
                    child: OutlinedButton(
                      onPressed: () => {
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return const LandingScreen2();
                          }, transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            var begin = const Offset(1.0, 0.0);
                            var end = Offset.zero;
                            var curve = Curves.ease;
                            var tween = Tween(begin: begin, end: end)
                                .chain(CurveTween(curve: curve));
                            var offsetAnimation = animation.drive(tween);

                            return SlideTransition(
                              position: offsetAnimation,
                              child: child,
                            );
                          }),
                        )
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all<Color>(Colors.white)),
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Next",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  )
                ]),
          ),
        ),
      ),
      backgroundColor: WasongColorThemes.yellowPale,
    );
  }
}

class LandingScreen2 extends StatelessWidget {
  const LandingScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Container(
            color: WasongColorThemes.yellowPale,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Image.asset("images/decor/logo.png"),
                      Stack(children: [
                        Material(
                          color: Colors.transparent,
                          child: Center(
                              child: SvgPicture.asset(
                            'images/decor/baumkuhen.svg',
                            semanticsLabel: 'My SVG Image',
                          )),
                        ),
                        Center(
                            child:
                                Image.asset("images/decor/landing_page_2.png"))
                      ]),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 16.0),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(text: '', children: [
                        TextSpan(
                          text: "Learn",
                          style: GoogleFonts.rubik(
                              color: Colors.black,
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: " from the ",
                          style: GoogleFonts.rubik(
                              color: Colors.black, fontSize: 32.0),
                        ),
                        TextSpan(
                          text: "best teachers!",
                          style: GoogleFonts.rubik(
                              color: Colors.black,
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 0.0, horizontal: 20.0),
                    child: OutlinedButton(
                      onPressed: () => {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainNavigation()),
                        )
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all<Color>(Colors.white)),
                      child: Text(
                        "Get Started",
                        style: GoogleFonts.rubik(color: Colors.black),
                      ),
                    ),
                  )
                ]),
          ),
        ),
      ),
      backgroundColor: WasongColorThemes.yellowPale,
    );
  }
}
