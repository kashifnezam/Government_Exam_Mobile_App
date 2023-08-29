import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:government_exam_pdf/create_account.dart';
import 'package:government_exam_pdf/product/home_screen.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(
    const GetMaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 2, left: 38, right: 38),
        child: ListView(
          children: [
            Lottie.asset("assets/animations/login.json", height: 300),
            TextField(
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigo, width: 2),
                ),
                floatingLabelAlignment: FloatingLabelAlignment.center,
                labelText: "Email",
                labelStyle: const TextStyle(fontSize: 18, color: Colors.indigo),
                prefixIcon: Icon(
                  Icons.email,
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
            const SizedBox(
              height: 30,
            ),
            TextField(
              decoration: InputDecoration(
                floatingLabelAlignment: FloatingLabelAlignment.center,
                labelText: "Password",
                labelStyle: const TextStyle(fontSize: 18, color: Colors.indigo),
                prefixIcon: Icon(
                  Icons.password,
                  color: Colors.indigo.shade300,
                ),
                suffixIcon: Icon(
                  Icons.visibility,
                  color: Colors.indigo.shade300,
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigo, width: 2),
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
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 45,
              child: ElevatedButton(
                onPressed: () {},
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Colors.indigo,
                  ),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 18, letterSpacing: 2),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.indigo)),
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(
                    const CreateAccount(),
                  );
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Colors.white,
                  ),
                ),
                child: const Text(
                  "Create an Account",
                  style: TextStyle(
                      color: Colors.indigo, fontSize: 18, letterSpacing: 2),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Get.off(
                  const MyHome(),
                );
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Skip",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        letterSpacing: 2),
                  ),
                  Icon(
                    Icons.arrow_forward,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
