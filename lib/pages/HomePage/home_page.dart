import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mie_ayu_rawalumbu/service/auth_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Divider(
              color: Colors.red,
            ),
            ElevatedButton(
              onPressed: () {
                AuthService.signOut();
                Navigator.pop(context);
              },
              child: Text("Sign Out"),
            ),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.red,
                  ),
                ),
                Text("OR"),
                Expanded(
                  child: Divider(
                    color: Colors.red,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
