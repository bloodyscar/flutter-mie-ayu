import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mie_ayu_rawalumbu/pages/IntroPage/intro_page.dart';
import 'package:mie_ayu_rawalumbu/pages/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool? status;

  // registration
  Future<bool> registrasiUser(String emailUser, String passwordUser) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: emailUser, password: passwordUser);
      return true;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // Sign in with email password
  Future<bool> signInEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email dude');
      } else if (e.code == 'wrong-password') {
        print('Wrong password dude');
      }
      throw Exception(e.code);
    }
  }

  // login with google
  static Future<bool> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  // login anon
  Future<bool> loginAnonymous() async {
    try {
      var user = await _auth.signInAnonymously();
      print(user);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // signout
  static Future<void> signOut() async {
    FirebaseAuth.instance.signOut();
    
    print("Logout Berhasil");
  }
}
