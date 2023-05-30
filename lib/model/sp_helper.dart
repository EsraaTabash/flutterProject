
import 'package:shared_preferences/shared_preferences.dart';
class SpHelper{

  static late SharedPreferences sharedPreferences;

  SpHelper._();

  //singleton
  //static SpHelper spHelper = SpHelper._();

  static initSharedPreferances()async{
    sharedPreferences = await SharedPreferences.getInstance();
  }
  static saveName(String value) {
    sharedPreferences.setString("name", value);
  }
  static String? getName() {
    return sharedPreferences.getString("name");
  }
  static updateName(String newValue) {
    sharedPreferences.setString("name", newValue);
  }
  static deleteName() {
    sharedPreferences.remove("name");
  }
  // bool getFirstTime() {
  //   bool x = sp.getBool("isFirstTime") ?? true;
  //   sp.setBool("isFirstTime", false);
  //   return x;
  // }
  //
  // setFirstTime() {
  //   sp.setBool("isFirstTime", false);
  // }

  static bool isNewUser(){
    bool? result = sharedPreferences.getBool("isNew");
    if(result == null){
      sharedPreferences.setBool("isNew", true);
      return true;
    }else{
      return false;
    }
}
}