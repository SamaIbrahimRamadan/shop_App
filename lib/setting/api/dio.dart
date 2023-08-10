import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  //بعمل create l dio
  static init() {
    dio = Dio(
      // بعرف ال dio
      BaseOptions(
          receiveDataWhenStatusError: true,
          // هات الداتا دايما
          baseUrl: 'https://student.valuxapps.com/api/'),
    );
  }

  static Future<Response> get(
      {required String url,
      Map<String, dynamic>? query,
      String? token,
      String? lang = 'en'}) async {
    dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token ?? '', // الي بيعرفني انا مين
    };
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> post(
      {required String url,
      dynamic data,
      String? lang = 'en',
      Map<String, dynamic>? query,
      String? token}) async {
    dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token ?? '' // put token
    }; //بحط الهيدر لما استدعي ال بوست
    return dio.post(url, data: data, queryParameters: query);
    // معموله عشان تودي داتا
    // data بحدد عندي كام متغر في الداتا علي اساس بوست مان وبحطهم علي اساس ماب
  }
}
