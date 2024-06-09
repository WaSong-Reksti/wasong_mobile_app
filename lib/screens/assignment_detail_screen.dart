import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wasong_mobile_app/models/assignment.dart';
import 'package:wasong_mobile_app/themes/color_themes.dart';

class AssignmentDetailScreen extends StatefulWidget {
  final Assignment assignment;
  const AssignmentDetailScreen({Key? key, required this.assignment})
      : super(key: key);

  @override
  State<AssignmentDetailScreen> createState() => _AssignmentDetailScreenState();
}

class _AssignmentDetailScreenState extends State<AssignmentDetailScreen> {
  late File _attachedFile;
  String _fileName = '';

  void _attachFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp3', 'wav', 'aac'],
    );
    if (result != null) {
      File file = File(result.files.single.path!);
      setState(() {
        _attachedFile = file;
        _fileName = file.path.split('/').last;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Assignment Info",
            style: GoogleFonts.rubik(fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromRGBO(253, 248, 238, 1),
        shadowColor: const Color.fromRGBO(51, 51, 51, 0.5),
        elevation: 2.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: double.infinity,
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.black, width: 1.0))),
                child: Text(
                  widget.assignment.title,
                  style: GoogleFonts.rubik(
                      fontSize: 25, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                constraints: const BoxConstraints(minHeight: 200),
                margin: const EdgeInsets.only(bottom: 20),
                child: Text(
                  widget.assignment.description,
                  style: GoogleFonts.rubik(),
                ),
              ),
              Text(
                "Due to: ${widget.assignment.deadline}",
                style: GoogleFonts.rubik(),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Attachment",
                style: GoogleFonts.rubik(
                    fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const Divider(
                height: 10,
                color: Colors.black,
              ),
              const SizedBox(
                height: 15.0,
              ),
              InkWell(
                onTap: _attachFile,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Container(
                    decoration:
                        const BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 2),
                        color: Color.fromARGB(140, 0, 0, 0),
                        blurRadius: 6,
                        spreadRadius: 2,
                      )
                    ]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Icon(Icons.attach_file),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              _fileName.isNotEmpty
                                  ? _fileName
                                  : "Attach a file",
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(4.0))),
                          shadowColor: WidgetStateProperty.all(Colors.black),
                          backgroundColor: WidgetStateProperty.all(
                              WasongColorThemes.orange)),
                      onPressed: () {
                        if (kDebugMode) {
                          print("File submitted");
                        }
                      },
                      child: Text(
                        "Submit",
                        style: GoogleFonts.rubik(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
