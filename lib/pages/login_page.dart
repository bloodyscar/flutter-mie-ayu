import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ayu_rawalumbu/pages/AuthPage/registration_page.dart';
import 'package:mie_ayu_rawalumbu/pages/main_page.dart';
import 'package:mie_ayu_rawalumbu/service/auth_service.dart';
import 'package:mie_ayu_rawalumbu/theme.dart';
import 'package:mie_ayu_rawalumbu/widget/loading_button.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController(text: '');
    TextEditingController passwordController = TextEditingController(text: '');

    handleSignInEmailPassword() async {
      if (await AuthService()
          .signInEmailPassword(emailController.text, passwordController.text)) {
        Get.to(MainPage());
      }
    }

    handleSignInGoogle() async {
      setState(() {
        isLoading = true;
      });
      if (await AuthService.signInWithGoogle()) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MainPage(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              "GAGAL LOGIN",
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
      setState(() {
        isLoading = false;
      });
    }

    
    Widget header() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome back,",
                style: primartyTextStyle.copyWith(
                    fontSize: 18, fontWeight: medium),
              ),
              Text(
                "You’ve been missed.",
                style: primartyTextStyle.copyWith(
                    fontSize: 18, fontWeight: medium),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(() => MainPage());
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(backgroundColor2),
            ),
            child: Text(
              "Skip",
              style: secondaryTextStyle,
            ),
          )
        ],
      );
    }

    Widget emailInput() {
      return Container(
        width: double.infinity,
        height: 56,
        margin: EdgeInsets.only(top: 40),
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
                      hintText: "Email Address",
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

    Widget forgotPasswordButton() {
      return Container(
        margin: EdgeInsets.only(top: 15),
        child: Row(
          children: [
            Spacer(),
            TextButton(
              onPressed: () {},
              child: Text(
                "Forgot Password?",
                style: darkGreyTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                    decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      );
    }

    Widget signInButton() {
      return Container(
        width: double.infinity,
        height: 56,
        margin: EdgeInsets.only(top: 15),
        child: TextButton(
          onPressed: handleSignInEmailPassword,
          style: TextButton.styleFrom(
            backgroundColor: backgroundColor2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            "Sign In",
            style: secondaryTextStyle.copyWith(
              fontSize: 16,
            ),
          ),
        ),
      );
    }

    Widget signInGoogle() {
      return Container(
        width: double.infinity,
        height: 56,
        child: TextButton(
            onPressed: () {
              handleSignInGoogle();
            },
            style: TextButton.styleFrom(
              backgroundColor: primaryTextColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: isLoading
                  ? LoadingButton()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/logo-google.png",
                          width: 24,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Sign In with Google",
                          style: secondaryTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
            )),
      );
    }

    Widget signUpButton() {
      return Center(
        child: Container(
          margin: EdgeInsets.only(top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Don’t have an account?",
                style: darkGreyTextStyle.copyWith(
                    fontSize: 12, fontWeight: medium),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => RegistrationPage(),
                    ),
                  );
                },
                child: Text(
                  "Sign Up Here",
                  style: primartyTextStyle.copyWith(
                      fontSize: 14, decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
        ),
      );
    }

    orDivider() {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            Expanded(
              child: Divider(
                color: Colors.white,
                thickness: 1,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "OR",
                style: primartyTextStyle.copyWith(fontSize: 16),
              ),
            ),
            Expanded(
              child: Divider(
                color: Colors.white,
                thickness: 1,
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            children: [
              header(),
              emailInput(),
              passwordInput(),
              forgotPasswordButton(),
              signInButton(),
              orDivider(),
              signInGoogle(),
              Spacer(),
              signUpButton(),
            ],
          ),
        ),
      ),
    );
  }
}
