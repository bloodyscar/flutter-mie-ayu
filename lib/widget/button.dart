import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {
  String title;
  Color bgColor;
  Color textColor;
  double height;
  double width;
  double textSize;
  Button({
    Key? key,
    required this.title,
    required this.width,
    required this.height,
    required this.bgColor,
    required this.textColor,
    required this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(
          Size(width, height),
        ),
        backgroundColor: MaterialStateProperty.all(bgColor),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(fontSize: textSize, color: textColor),
      ),
    );
  }
}
