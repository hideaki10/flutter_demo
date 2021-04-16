import 'package:dio/dio.dart';

class DioTest {
  void getHttp() async {
    try {
      var response =
          await Dio().get('http://pod.j-wave.co.jp/blog/tokiohot100/index.xml');
      print(response);
    } catch (e) {
      print(e);
    }
  }
}
