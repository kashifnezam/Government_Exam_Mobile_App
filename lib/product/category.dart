import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 21.0),
            child: Icon(Icons.search),
          ),
        ],
        centerTitle: true,
        title: Text(
          Get.arguments,
          style: const TextStyle(fontSize: 18, letterSpacing: 2),
        ),
        backgroundColor: Colors.indigo.shade200,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("pdf")
            .where("category",
                isEqualTo: Get.arguments.toString().toLowerCase())
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data!.docs.isEmpty) {
            return const Text("no data found");
          }
          if (snapshot.data != null) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Text(snapshot.data!.docs[index]["fileName"]);
              },
              itemCount: snapshot.data!.docs.length,
            );
          }
          return const Text("went wrong");
        },
      ),
    );
  }
}
