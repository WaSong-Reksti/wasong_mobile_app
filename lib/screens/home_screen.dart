import 'package:flutter/material.dart';
import 'package:wasong_mobile_app/components/class_grid.dart';
import 'package:wasong_mobile_app/screens/search_result_screen.dart';
import 'package:wasong_mobile_app/utilities/dummy_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String user = "Toper";
  String searchQuery = "";

  // Daftar widget untuk setiap tab

  @override
  Widget build(BuildContext context) {
    const List<Map<String, dynamic>> classList = DummyData.classesData;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 42,
            // alignment: Alignment.bottomCenter,
            child: TextField(
              onChanged: (text) {
                setState(() {
                  searchQuery = text;
                });
              },
              decoration: InputDecoration(
                  // labelText: 'Search Classes',
                  // labelStyle: const TextStyle(color: Color(0xfff1f1f1)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: const Color(0xff333333),
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search Classes',
                  prefixIconColor: const Color(0xfff1f1f1),
                  hintStyle: const TextStyle(color: Color(0xfff1f1f1))),
              textAlignVertical: TextAlignVertical.bottom,
              style: const TextStyle(color: Color(0xfff1f1f1)),
              onSubmitted: (value) {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return SearchResultScreen(query: value);
                  },
                ));
              },
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black54))),
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                "Classes For You",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xff333333),
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          const Expanded(
            child: ClassGrid(
              classInformation: classList,
              numberOfCols: 2,
            ),
          ),
        ],
      ),
    );
  }
}
