import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ayu_rawalumbu/service/auth_service.dart';
import 'package:mie_ayu_rawalumbu/theme.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController(text: '');
    TextEditingController passwordController = TextEditingController(text: '');

    handleRegistrasi() async {
      try {
        if (await AuthService()
            .registrasiUser(emailController.text, passwordController.text)) {
          Get.snackbar("SUKSES", "REGISTRASI BERHASIL");
        }
      } catch (e) {
        Get.snackbar("GAGAL", e.toString());
      }
    }

    // Widget fullNameInput() {
    //   return Container(
    //     width: double.infinity,
    //     height: 56,
    //     margin: EdgeInsets.only(top: 40),
    //     decoration: BoxDecoration(
    //       color: Colors.white,
    //       borderRadius: BorderRadius.circular(12),
    //     ),
    //     child: Container(
    //       margin: EdgeInsets.symmetric(
    //         horizontal: 25,
    //       ),
    //       child: Row(
    //         children: [
    //           Icon(
    //             Icons.person_outline_rounded,
    //             color: boxDescriptionColor,
    //           ),
    //           SizedBox(
    //             width: 20,
    //           ),
    //           Expanded(
    //             child: TextFormField(
    //               controller: nameController,
    //               decoration: InputDecoration.collapsed(
    //                   hintText: "Full Name",
    //                   hintStyle: TextStyle(
    //                       color: boxDescriptionColor,
    //                       fontSize: 16,
    //                       fontWeight: medium)),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   );
    // }

    Widget emailInput() {
      return Container(
        width: double.infinity,
        height: 56,
        margin: EdgeInsets.only(top: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: Row(
            children: [
              Icon(
                Icons.email_outlined,
                color: boxDescriptionColor,
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration.collapsed(
                      hintText: "Email",
                      hintStyle: TextStyle(
                          color: boxDescriptionColor,
                          fontSize: 16,
                          fontWeight: medium)),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget passwordInput() {
      return Container(
        width: double.infinity,
        height: 56,
        margin: EdgeInsets.only(top: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: Row(
            children: [
              Icon(
                Icons.lock_outline,
                color: boxDescriptionColor,
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration.collapsed(
                      hintText: "Password",
                      hintStyle: TextStyle(
                          color: boxDescriptionColor,
                          fontSize: 16,
                          fontWeight: medium)),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget registrationButton() {
      return Container(
        width: double.infinity,
        height: 56,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: handleRegistrasi,
          style: TextButton.styleFrom(
            backgroundColor: backgroundColor2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            "Registration",
            style: secondaryTextStyle.copyWith(
              fontSize: 16,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Sign Up"),
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        backgroundColor: backgroundColor1,
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            children: [
              emailInput(),
              passwordInput(),
              registrationButton(),
            ],
          ),
        ),
      ),
    );
  }
}
