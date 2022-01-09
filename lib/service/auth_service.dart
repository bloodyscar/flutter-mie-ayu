import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  // registration
  Future<bool> registrasiUser(String emailUser, String passwordUser) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: emailUser, password: passwordUser);
      return true;
    } catch (e) {
      return false;
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
      print(userCredential.user!.email);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return false;
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
