import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wasong_mobile_app/components/class_grid.dart';
import 'package:wasong_mobile_app/handlers/crud_handlers.dart';
import 'package:wasong_mobile_app/screens/login_screen.dart';
import 'package:wasong_mobile_app/screens/search_result_screen.dart';
import 'package:wasong_mobile_app/utilities/dummy_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchQuery = "";
  TextEditingController _searchController = TextEditingController();

  // Daftar widget untuk setiap tab
  late Future<dynamic> session;
  late Future<dynamic> classesData;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: searchQuery);
    session = CrudHandlers.getSession();
    classesData = CrudHandlers.getClasses();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: classesData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            if (snapshot.error
                .toString()
                .contains('Token revoked or expired')) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return const LoginScreen();
                }));
              });
            }
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final List<dynamic> dataList = snapshot.data! as List<dynamic>;
            final classList =
                dataList.map((item) => item as Map<String, dynamic>).toList();
            if (kDebugMode) {
              print(classesData);
            }
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 42,
                    // alignment: Alignment.bottomCenter,
                    child: TextField(
                      controller: _searchController,
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
                        border:
                            Border(bottom: BorderSide(color: Colors.black54))),
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
                  Expanded(
                    child: ClassGrid(
                      classInformation: classList,
                      numberOfCols: 2,
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }
}
