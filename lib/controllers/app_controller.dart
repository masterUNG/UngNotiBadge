import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  RxInt indexBody = 0.obs;

  RxInt amountNoti = 0.obs;

  Future<void> readJsonAPI() async {
    String urlApi = 'https://api.jobbkk.com/v1/notify/interview';
    var dio = Dio();
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Authorization'] =
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJkYXRhIjp7InVzZXJuYW1lIjoiYXBpbnlhLm4wOUBnbWFpbC5jb20iLCJtZW1iZXJfdXNlcl9pZCI6NDEwNTIwNCwibWVtYmVyX2lkIjozMzk0NDY1fSwiaWF0IjoxNjY2NjgyODI2MzczfQ.uJsRXN_AEdQ6Jthbq_qUKyhOax2tk2IWd5aXJi-m62A';

    await dio.get(urlApi).then((value) {
      print('##1nov value readJsonAPI ==> $value');
    });
  }

  Future<void> readDataFromAPI() async {
    String url = 'https://api.jobbkk.com/v1/notify/interview';
    var dio = Dio();
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Authorization'] =
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJkYXRhIjp7InVzZXJuYW1lIjoiYXBpbnlhLm4wOUBnbWFpbC5jb20iLCJtZW1iZXJfdXNlcl9pZCI6NDEwNTIwNCwibWVtYmVyX2lkIjozMzk0NDY1fSwiaWF0IjoxNjY2NjgyODI2MzczfQ.uJsRXN_AEdQ6Jthbq_qUKyhOax2tk2IWd5aXJi-m62A';

    await dio.get(url).then((value) {
      print('responst ==> $value');

      // Map<String, dynamic> map = value.data;
      amountNoti.value = 4;
    }).catchError((value) {
      print('error api ==> $value');
    });
  }

  void increaseAmountNoti() {
    amountNoti++;
  }
}
