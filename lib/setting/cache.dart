import 'package:shared_preferences/shared_preferences.dart';

// Cache.init() بعرفها في main
class Cache {
  static late SharedPreferences sharedPreference; //بعرف object
  static init() async {
    sharedPreference = await SharedPreferences.getInstance(); // عرفته
  }

  static dynamic getData({required String key}) {
    return sharedPreference
        .get(key); // باخد الداتا عن طريق ال key لي حطيت بيه الداتا
  }

  static Future<bool> clearData({required String key}) async {
    return await sharedPreference.remove(key);
  }

  static Future<bool> savaData(
      //  بحط الداتا بتختف من نوع ل نوع
      // بحط الداتا عن طريق map key value
      // always return bool
      {required String key,
      required dynamic value}) async {
    if (value is String) {
      return await sharedPreference.setString(key, value);
    } // if data is string go to inside it
    if (value is int) {
      return await sharedPreference.setInt(key, value);
    }
    if (value is bool) {
      return await sharedPreference.setBool(key, value);
    }
    return await sharedPreference.setDouble(key, value);
  }
}
