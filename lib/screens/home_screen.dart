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
        "title": "Kelas Keyboard",
      },
      {
        "imageUrl":
            "https://static.miraheze.org/bluearchivewiki/thumb/b/b4/Arisu_%28Maid%29.png/399px-Arisu_%28Maid%29.png",
        "title": "Kelas Maid",
      },
      {
        "imageUrl":
            "https://static.miraheze.org/bluearchivewiki/thumb/9/93/Hatsune_Miku.png/399px-Hatsune_Miku.png",
        "title": "Kelas Vocaloid",
      },
      {
        "imageUrl":
            "https://static.miraheze.org/bluearchivewiki/thumb/7/7d/Rumi.png/399px-Rumi.png",
        "title": "Kelas Memasak",
      },
      {
        "imageUrl":
            "https://static.miraheze.org/bluearchivewiki/thumb/2/20/Hina_%28Dress%29.png/399px-Hina_%28Dress%29.png",
        "title": "Kelas Piano",
      },
    ];
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
