import 'package:dio/dio.dart';
import 'package:get/get.dart';
// import 'package:get/get_connect/connect.dart';
import 'package:getx_news_api/core/models/article.dart';
import 'package:getx_news_api/core/models/news_response_model.dart';
import 'package:getx_news_api/core/repository/news_reposiroty.dart';
import 'package:getx_news_api/service/http_service.dart';
import 'package:getx_news_api/service/http_service_implementation.dart';

class NewsReposirotyImpl implements NewsRepos {
  late HttpService _httpService;

  NewsReposirotyImpl() {
    // code fo rinitialising within the get package
    _httpService = Get.put(HttpServiceImpl());

    _httpService.init();
  }
  @override
  Future<List<Article>> getNewsHealdine() async {
    // throw UnimplementedError();
    NewsReponse? parsedResponse;
    try {
      final response =
          await _httpService.getRequest("/v2/top-healdine?country=ke");
      parsedResponse = NewsReponse.fromJson(response.data);

// uncomment below if code throws error
      // return parsedResponse.articles;
    } on Exception catch (e) {
      print(e);
    }

    return parsedResponse!.articles;
  }

  @override
  Future<List<Article>> getSearchedNews(String searchTerm) async {
    // TODO: implement getSearchedNews

    NewsReponse? parsedResponse;
    try {
      final response =
          await _httpService.getRequest("/v2/everything?q=$searchTerm");
      parsedResponse = NewsReponse.fromJson(response.data);

// uncomment below if code throws error
      return parsedResponse.articles;
    } on Exception catch (e) {
      print(e);
    }

    return parsedResponse!.articles;
  }
}
