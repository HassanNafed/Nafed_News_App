import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{

  static late SharedPreferences sharedPreferences;   
  static init()async{
    sharedPreferences=await SharedPreferences.getInstance();

  }
   static Future<bool> putBoolean({
    required String key,
    required bool value,
  }) async {
    // Ensure sharedPreferences is initialized before using it.
    // ignore: unnecessary_null_comparison
    if (sharedPreferences == null) {
      await init();
    }
    return await sharedPreferences.setBool(key, value);
  }

 static bool getBoolean({
    required String key,
  }) {
    // Ensure sharedPreferences is initialized before using it.
    // ignore: unnecessary_null_comparison
    if (sharedPreferences == null) {
      throw Exception("SharedPreferences has not been initialized.");
    }
    return sharedPreferences.getBool(key) ?? false; // Provide a default value if the key is not found.
  }
}