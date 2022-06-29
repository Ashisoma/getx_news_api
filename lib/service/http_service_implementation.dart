// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:getx_news_api/service/http_service.dart';

const BASE_URL = 'https://newsapi.org/';
const API_KEY = '3455ebe865014d689b27192516d2823b';

class HttpServiceImpl implements HttpService {
  late Dio _dio;

  @override
  Future<Response> getRequest(String url) async {
    // TODO: implement getRequest
    Response response;
    try {
      response = await _dio.get(url);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }

  // WE ADD INTECEPTORS TO HELP IN MONITORING THE REQUEST WE ARE MAKINS
  initialiseInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (e, handler) {
        print(e.message);
      },
      onRequest: (request, handler) {
        print("${request.method} | ${request.path}");
      },
      onResponse: (response, handler) {
        print(
            "${response.statusCode} | ${response.statusMessage} | ${response.data}");
      },
    ));
  }

  @override
  void init() {
    _dio = Dio(BaseOptions(
        baseUrl: BASE_URL, headers: {'Authorization': 'Bearer $API_KEY'}));

    initialiseInterceptors();
  }
}
