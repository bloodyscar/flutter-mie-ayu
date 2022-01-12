import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mie_ayu_rawalumbu/pages/IntroPage/intro_page.dart';
import 'package:mie_ayu_rawalumbu/pages/main_page.dart';
import 'package:mie_ayu_rawalumbu/service/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  bool? status;

  Future<bool> loginUser(String email, String password) async {
    var getUserLogin = await AuthService().signInEmailPassword(email, password);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLoggedIn", true);
    print(status);
    notifyListeners();

    return true;
  }

  Future<void> isLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    status = prefs.getBool('isLoggedIn') ?? false;
    print(status);
    if (status!) {
      Get.offAll(MainPage());
    } else {
      Get.to(IntroPage());
    }
  }

  userLogout() async {
    await AuthService.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('isLoggedIn')) {
      prefs.clear();
    }
    print("Logout Berhasil");
    notifyListeners();
  }
}
