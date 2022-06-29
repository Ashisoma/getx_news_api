import 'package:getx_news_api/core/models/article.dart';

abstract class NewsRepos {
  Future<List<Article>> getNewsHealdine();
  Future<List<Article>> getSearchedNews(String searchTerm);  
}
