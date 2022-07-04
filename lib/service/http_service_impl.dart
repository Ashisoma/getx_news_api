
import 'package:dio/dio.dart';
import 'package:getx_news_api/service/http_service.dart';
// import 'package:getx_news_app_impl/service/http_service.dart';

const BASE_URL = "https://newsapi.org/";
const API_KEY = "fb12a31181aa4498ba52877978913275";

class HttpServiceImpl implements HttpService{

  late Dio _dio;

  @override
  Future<Response> getRequest(String url) async{
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

  initializeInterceptors(){
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (error, handler){
        print(error.message);
      },
      onRequest: (request, handler){
        print("${request.method} | ${request.path}");
      },
      onResponse: (response, handler){
        print("${response.statusCode} ${response.statusMessage} ${response.data}");
      }
    ));
  }

  @override
  void init() {
    _dio = Dio(BaseOptions(
      baseUrl: BASE_URL,
      headers: {"Authorization" : "Bearer $API_KEY"}
    ));

    initializeInterceptors();
  }

}