import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 12, left: 38, right: 38),
        child: ListView(
          children: [
            Lottie.asset("assets/animations/signup.json", height: 200),
            TextField(
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigo, width: 2),
                ),
                floatingLabelAlignment: FloatingLabelAlignment.center,
                labelText: "Full Name",
                labelStyle: const TextStyle(fontSize: 18, color: Colors.indigo),
                prefixIcon: Icon(
                  Icons.person,
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
                labelText: "Email",
                labelStyle: const TextStyle(fontSize: 18, color: Colors.indigo),
                prefixIcon: Icon(
                  Icons.email_rounded,
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
            TextField(
              decoration: InputDecoration(
                floatingLabelAlignment: FloatingLabelAlignment.center,
                labelText: "Mobile Number",
                labelStyle: const TextStyle(fontSize: 18, color: Colors.indigo),
                prefixIcon: Icon(
                  Icons.numbers,
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
            TextField(
              decoration: InputDecoration(
                floatingLabelAlignment: FloatingLabelAlignment.center,
                labelText: "Confirm Password",
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
                onPressed: () {
                  Get.back();
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Colors.indigo,
                  ),
                ),
                child: const Text(
                  "Sign Up",
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
                  Get.back();
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Colors.white,
                  ),
                ),
                child: const Text(
                  "Sign In",
                  style: TextStyle(
                      color: Colors.indigo, fontSize: 18, letterSpacing: 2),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
