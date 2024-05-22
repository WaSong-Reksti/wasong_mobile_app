import 'package:flutter/material.dart';
import 'package:wasong_mobile_app/components/class_card.dart';

class ClassGrid extends StatelessWidget {
  final List<Map<String, dynamic>> classInformation;
  final int numberOfCols;

  const ClassGrid({
    Key? key,
    required this.classInformation,
    required this.numberOfCols,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: classInformation.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: numberOfCols,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        final item = classInformation[index];
        return ClassCard(
          imageUrl: item["imageUrl"].toString(),
          title: item["title"].toString(),
        );
      },
      shrinkWrap: true,
    );
  }
}
