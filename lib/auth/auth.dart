import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:government_exam_pdf/product/home_screen.dart';

Future<void> signUp(
    String fullname, String mobile, String email, String pass) async {
  User? currUser = FirebaseAuth.instance.currentUser;

  await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: pass)
      .then(
    (value) async {
      try {
        await FirebaseFirestore.instance
            .collection("user")
            .doc(currUser!.uid)
            .set(
          {
            "fullname": fullname,
            "mobile": mobile,
            "email": email,
            "dataCreated": DateTime.now(),
            "userID": currUser.uid,
            "isAdmin": false,
          },
        ).then((value) => {
                  FirebaseAuth.instance.signOut(),
                  Get.back(),
                });
        debugPrint("Saved DAta");
      } catch (e) {
        // Get.snackbar("Error", "Error: $e", snackPosition: SnackPosition.BOTTOM);
        debugPrint("erropr hogya=--------------------------------\n----\n $e");
      }
    },
  );
}

// Store Magazine Url

//  Login User
Future<void> login(String email, String pass) async {
  try {
    User? currUser = (await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: pass))
        .user;
    if (currUser != null) {
      Get.to(() => const MyHome());
    } else {
      debugPrint("Somwthing Went Wrong");
    }
  } catch (e) {
    debugPrint("Hogya gadbad $e");
  }
}

Future<void> uploadPDF(
    String fileName, File filePDF, File fileThumb, String category) async {
  // for Actual PDF File
  final refPDF = FirebaseStorage.instance
      .ref("pdfs/$category/${fileName.split(".")[0]}.pdf");
  await refPDF.putFile(filePDF);
  final downLinkPDF = await refPDF.getDownloadURL();

  // for PDF thumbnail
  final refThumb = FirebaseStorage.instance
      .ref("pdfs/$category/${fileName.split(".")[0]}.png");
  await refThumb.putFile(fileThumb);
  final downLinkThumb = await refPDF.getDownloadURL();

  User? currUser = FirebaseAuth.instance.currentUser;
  await FirebaseFirestore.instance.collection("pdf").doc().set({
    "userID": currUser?.uid,
    "URL": downLinkPDF,
    "isAdmin": false,
    "fileName": fileName,
    "thumbName": "${fileName.split(".")[0]}.png",
    "category": category,
    "email": currUser?.email,
    "thumbnailURL": downLinkThumb,
    "uploadedTime": DateTime.now(),
  }).then(
    (value) => debugPrint("Data Saved -----------"),
  );
}
