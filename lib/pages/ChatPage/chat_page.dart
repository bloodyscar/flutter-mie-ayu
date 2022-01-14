import 'package:cached_network_image/cached_network_image.dart';
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
          CachedNetworkImage(
            imageUrl:
                "https://res.cloudinary.com/adithrw/image/upload/v1642080565/n_yrkrer.png",
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
              child: Container(
                width: 10,
                height: 10,
                child: CircularProgressIndicator(
                  value: downloadProgress.progress,
                  strokeWidth: 1,
                ),
              ),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
            imageBuilder: (context, imageProvider) => Container(
              width: width,
              height: height * 0.4,
              decoration: BoxDecoration(
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
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
