

import 'dart:developer';

import 'package:dio/dio.dart';



class DioService {


Dio dio = Dio();
  Future<dynamic> getHomePageBlog(String url)async{
    Dio dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    return await dio
        .get(url,
        options: Options(responseType: ResponseType.json, method: 'GET'))
        .then((response) {

      return response;
    });
  }


}