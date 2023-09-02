import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:government_exam_pdf/auth/auth.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  // name File and thumbnail
  String fileNamePDF = "";
  late File filePDF;
  String fileNameThumb = "";
  late File fileThumb;

  late TextEditingController pdfController;
  bool isButton = false;
  bool isButtonPDF = false;
  bool isButtonTHUMB = false;
  bool isUploading = false;
  @override
  void initState() {
    super.initState();
    pdfController = TextEditingController();
    pdfController.addListener(() {
      setState(() {
        isButton = fileNamePDF.isNotEmpty &&
            fileNameThumb.isNotEmpty &&
            pdfController.text.trim().isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    pdfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void pickFilePDF() async {
      final pickedFile = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ["pdf"],
      );

      if (pickedFile != null) {
        fileNamePDF = pickedFile.files[0].name;
        filePDF = File(pickedFile.files[0].path!);
        setState(() {
          isButtonPDF = true;
        });
      }
    }

    void pickFileThumb() async {
      final pickedFile = await FilePicker.platform.pickFiles(
        type: FileType.image,
        // allowedExtensions: ["jpg", "jpeg", "png"],
      );

      if (pickedFile != null) {
        fileNameThumb = pickedFile.files[0].name;
        fileThumb = File(pickedFile.files[0].path!);
        setState(() {
          isButtonTHUMB = true;
        });
      }
    }

    Future<void> uploadFile(category) async {
      setState(() {
        isUploading = true;
      });
      try {
        await uploadPDF(fileNamePDF, filePDF, fileThumb, category);
      } catch (e) {
        debugPrint("Upload Filed Failed:  $e");
      }
      setState(() {
        isButton = false;
        isButtonPDF = false;
        isButtonTHUMB = false;
        pdfController.text = "";
        isUploading = false;
      });
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Admin Area",
          style: TextStyle(fontSize: 18, letterSpacing: 2),
        ),
        backgroundColor: Colors.indigo.shade200,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 53, horizontal: 22),
        children: [
          TextField(
            controller: pdfController,
            decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.indigo, width: 2),
              ),
              floatingLabelAlignment: FloatingLabelAlignment.center,
              labelText: "Category Name",
              helperText: "eg. Magazines, Books, Others",
              labelStyle: const TextStyle(fontSize: 18, color: Colors.indigo),
              prefixIcon: Icon(
                Icons.picture_as_pdf,
                color: Colors.indigo.shade300,
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.indigo),
                borderRadius: BorderRadius.all(
                  Radius.circular(13),
                ),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(13),
                ),
                borderSide: BorderSide(style: BorderStyle.solid),
              ),
            ),
          ),

          //  --------------PDF Thumbnail -------
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            // decoration: BoxDecoration(border: Border.all(color: Colors.indigo)),
            height: 45,
            child: !isButtonTHUMB
                ? ElevatedButton(
                    onPressed: () {
                      pickFileThumb();
                    },
                    child: const Text(
                      "Choose Thumbnail for PDF",
                      style: TextStyle(
                        fontSize: 18,
                        letterSpacing: 2,
                        color: Colors.indigo,
                      ),
                    ),
                  )
                : const ElevatedButton(
                    onPressed: null,
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.white,
                      ),
                    ),
                    child: Text(
                      "Selected",
                      style: TextStyle(fontSize: 18, letterSpacing: 2),
                    ),
                  ),
          ),

          //  --------------Original PDF -------
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            // decoration: BoxDecoration(border: Border.all(color: Colors.indigo)),
            height: 45,
            child: !isButtonPDF
                ? ElevatedButton(
                    onPressed: () {
                      pickFilePDF();
                    },
                    child: const Text(
                      "Choose PDF only",
                      style: TextStyle(
                        fontSize: 18,
                        letterSpacing: 2,
                        color: Colors.indigo,
                      ),
                    ),
                  )
                : const ElevatedButton(
                    onPressed: null,
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.white,
                      ),
                    ),
                    child: Text(
                      "Selected",
                      style: TextStyle(fontSize: 18, letterSpacing: 2),
                    ),
                  ),
          ),

          //  ----------------Upload Button -----------------
          const SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.indigo)),
            height: 45,
            child: isButton 
                ? isUploading
                        ? const SizedBox(
                            height: 30,
                            width: 30,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: Colors.black,
                                strokeWidth: 2,
                              ),
                            ),
                          )
                        : ElevatedButton(
                    onPressed: () {
                      uploadFile(pdfController.text.trim());
                    },
                    child: const Text(
                      "Upload",
                      style: TextStyle(
                        fontSize: 18,
                        letterSpacing: 2,
                        color: Colors.indigo,
                      ),
                    ),
                  )
                : const ElevatedButton(
                    onPressed: null,
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.white,
                      ),
                    ),
                    child: Text(
                      "Upload",
                      style: TextStyle(fontSize: 18, letterSpacing: 2),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
