import 'package:app_ecommerce/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static String userName = 'userName';
  static String userEmail = 'userEmail';

  static saveCurrentUser(String userName, String email) async {
    saveUserName(userName);
    saveEmail(email);
  }

  static Future<User> getCurrentUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var username = prefs.getString(userName);
    var email = prefs.getString(userEmail);
    return new User(username, email, null);
  }

  static removeCurrentUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(userName);
    prefs.remove(userEmail);
  }

  static saveUserName(String usname) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(userName, usname);
  }

  static saveEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(userEmail, email);
  }

  static Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(userName);
  }
}
