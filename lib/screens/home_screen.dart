import 'package:flutter/material.dart';
import 'package:wasong_mobile_app/components/class_grid.dart';

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
    const List<Map<String, dynamic>> classList = [
      {
        "imageUrl":
            "https://static.miraheze.org/bluearchivewiki/thumb/c/ca/Yoshimi_%28Band%29.png/399px-Yoshimi_%28Band%29.png",
        "title": "Kelas Gitar",
      },
      {
        "imageUrl":
            "https://static.miraheze.org/bluearchivewiki/thumb/9/90/Natsu.png/399px-Natsu.png",
        "title": "Kelas Drum",
      },
      {
        "imageUrl":
            "https://static.miraheze.org/bluearchivewiki/thumb/3/36/Kazusa_%28Band%29.png/399px-Kazusa_%28Band%29.png",
        "title": "Kelas Bass",
      },
      {
        "imageUrl":
            "https://static.miraheze.org/bluearchivewiki/thumb/c/c5/Airi_%28Band%29.png/399px-Airi_%28Band%29.png",
        "title": "Kelas Piano",
      }
    ];
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
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
                  hintText: 'Seach Classes',
                  prefixIconColor: const Color(0xfff1f1f1),
                  hintStyle: const TextStyle(color: Color(0xfff1f1f1))),
              textAlignVertical: TextAlignVertical.bottom,
              style: const TextStyle(color: Color(0xfff1f1f1)),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Classes For You",
              style: TextStyle(
                  color: Color(0xff333333),
                  fontSize: 26,
                  fontWeight: FontWeight.w700),
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
