import 'package:flutter/material.dart';
import 'package:wasong_mobile_app/components/class_card.dart';
import 'package:wasong_mobile_app/screens/class_detail_screen.dart';

class ClassGrid extends StatefulWidget {
  final List<Map<String, dynamic>> classInformation;
  final int numberOfCols;

  const ClassGrid({
    Key? key,
    required this.classInformation,
    required this.numberOfCols,
  }) : super(key: key);

  @override
  ClassGridState createState() => ClassGridState();
}

class ClassGridState extends State<ClassGrid> {
  double opacity = 1.0;
  double scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.classInformation.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: widget.numberOfCols,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        final item = widget.classInformation[index];
        return GestureDetector(
          onTap: () {
            setState(() {
              opacity = 0.8;
              scale = 0.95;
            });
            Future.delayed(const Duration(milliseconds: 100), () {
              setState(() {
                opacity = 1.0;
                scale = 1.0;
              });
            });
            Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return ClassDetailScreen(classInfo: {
                    "imageUrl": widget.classInformation[index]["imageUrl"],
                    "title": widget.classInformation[index]["title"],
                    "description": widget.classInformation[index]
                        ["description"],
                    "instrument": widget.classInformation[index]["instrument"],
                  }); // Navigate to ClassDetailScreen
                },
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
              ),
            );
          },
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: opacity,
            child: Transform.scale(
              scale: scale,
              child: ClassCard(
                imageUrl: item["imageUrl"].toString(),
                title: item["title"].toString(),
              ),
            ),
          ),
          onTapDown: (details) {
            // On tap down, reduce opacity and scale the card
            setState(() {
              opacity = 0.8;
              scale = 0.95;
            });
          },
          onTapUp: (_) {
            // On tap up, reset opacity and scale
            setState(() {
              opacity = 1.0;
              scale = 1.0;
            });
          },
          onTapCancel: () {
            // On tap cancel, reset opacity and scale
            setState(() {
              opacity = 1.0;
              scale = 1.0;
            });
          },
        );
      },
      shrinkWrap: true,
    );
  }
}
