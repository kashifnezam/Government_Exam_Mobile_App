import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:government_exam_pdf/main.dart';
import 'package:government_exam_pdf/product/admin.dart';
import 'package:government_exam_pdf/product/category.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    List category = ["Magazine", "Books"];
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => {
            FirebaseAuth.instance.signOut().then(
                  (value) => Get.off(
                    () => const MyApp(),
                  ),
                )
          },
          child: const Icon(Icons.menu),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 21.0),
            child: InkWell(
              onDoubleTap: () => Get.to(() => const Admin()),
              child: const Icon(Icons.person_4_outlined),
            ),
          ),
        ],
        centerTitle: true,
        title: const Text(
          "Home Page",
          style: TextStyle(fontSize: 18, letterSpacing: 2),
        ),
        backgroundColor: Colors.indigo.shade200,
      ),
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Card(
            margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 55),
            elevation: 8,
            child: InkWell(
              onTap: () =>
                  Get.to(() => const Category(), arguments: category[1]),
              child: Column(
                children: [
                  Center(
                    child: Image.asset(
                      "assets/images/magazine.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      category[0],
                      style: const TextStyle(
                          fontSize: 18,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 55),
            elevation: 8,
            child: InkWell(
              onTap: () => Get.to(
                () => const Category(),
                arguments: category[1],
              ),
              child: Column(
                children: [
                  Center(
                    child: Image.asset(
                      "assets/images/book.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      category[1],
                      style: const TextStyle(
                          fontSize: 18,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            color: Colors.indigo.shade50,
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "Availabe in Hindi and English",
                style: TextStyle(
                    fontSize: 18,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
