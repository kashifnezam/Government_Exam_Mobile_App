import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:government_exam_pdf/auth/auth.dart';
import 'package:government_exam_pdf/create_account.dart';
import 'package:government_exam_pdf/product/home_screen.dart';
import 'package:lottie/lottie.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  User? user;
  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    return user != null
        ? const MyHome()
        : Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                "Account Login",
                style: TextStyle(fontSize: 18, letterSpacing: 2),
              ),
              backgroundColor: Colors.indigo.shade200,
            ),
            body: Container(
              margin: const EdgeInsets.only(top: 2, left: 38, right: 38),
              child: ListView(
                children: [
                  Lottie.asset("assets/animations/login.json", height: 300),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.indigo, width: 2),
                      ),
                      floatingLabelAlignment: FloatingLabelAlignment.center,
                      labelText: "Email",
                      labelStyle:
                          const TextStyle(fontSize: 18, color: Colors.indigo),
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
                    controller: passController,
                    decoration: InputDecoration(
                      floatingLabelAlignment: FloatingLabelAlignment.center,
                      labelText: "Password",
                      labelStyle:
                          const TextStyle(fontSize: 18, color: Colors.indigo),
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
                        String email = emailController.text.trim();
                        String pass = passController.text.trim();
                        login(email, pass);
                        debugPrint(email);
                        debugPrint(pass);
                      },
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
                          () => const CreateAccount(),
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
                            color: Colors.indigo,
                            fontSize: 18,
                            letterSpacing: 2),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.off(
                        () => const MyHome(),
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
