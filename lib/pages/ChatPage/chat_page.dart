import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<QuerySnapshot<Object?>> getData() {
      CollectionReference products =
          FirebaseFirestore.instance.collection('products');
      return products.get();
    }

    return Scaffold(
      body: FutureBuilder<QuerySnapshot<Object?>>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            print("CONNECTION DONE");
            var product = snapshot.data!.docs[0].data() as Map<String, dynamic>;
            print(product["name"]);
            return Center(child: Text("${product["name"]}"));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
