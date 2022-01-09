import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 10,
          height: 10,
          child: CircularProgressIndicator(
            strokeWidth: 2,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text("Loading..."),
      ],
    );
  }
}
