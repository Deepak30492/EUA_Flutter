import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  ///USER PROFILE
  static const String _userName = "username";
  static const String _userAddress = "useraddress";
  static const String _userContactNumber = "usercontactnumber";
  static const String _userEmail = "useremail";

  ///USER NAME SET METHOD
  static setUserName(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_userName, value);
  }

  ///USER NAME GET METHOD
  static Future<String?> getUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userName);
  }

  ///USER ADDRESS SET METHOD
  static setUserAddress(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_userAddress, value);
  }

  ///USER ADDRESS GET METHOD
  static Future<String?> getUserAddress() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userAddress);
  }

  ///USER CONTACT NUMBER SET METHOD
  static setUserContactNumber(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_userContactNumber, value);
  }

  ///USER CONTACT NUMBER GET METHOD
  static Future<String?> getUserContactNumber() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userContactNumber);
  }

  ///USER EMAIL SET METHOD
  static setUserEmail(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_userEmail, value);
  }

  ///USER EMAIL GET METHOD
  static Future<String?> getUserEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userEmail);
  }
}
