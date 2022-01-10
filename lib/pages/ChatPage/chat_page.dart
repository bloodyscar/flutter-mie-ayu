import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mie_ayu_rawalumbu/theme.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: width,
            height: height * 0.4,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/n.png"), fit: BoxFit.cover),
            ),
          ),
          Text(
            "Chat Page",
            style: primartyTextStyle.copyWith(fontSize: 20),
          )
        ],
      ),
    );
  }
}
