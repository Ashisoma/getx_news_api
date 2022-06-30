import 'package:get/get.dart';
import 'package:getx_news_api/core/models/article.dart';
import 'package:getx_news_api/core/repository/news_repo_implementation.dart';
import 'package:getx_news_api/core/repository/news_reposiroty.dart';

class NewsHeadlineController extends GetxController {
  late NewsRepos _newsRepo;

  NewsHeadlineController() {
    _newsRepo = Get.find<NewsReposirotyImpl>();
  }

  RxBool isLaoding = false.obs;
  // observable list, can observe changes to the list and update the UI accordingly
  late RxList<Article> articles;

  loadNewsHeadline() async {
    showLoading();

    final resulsts = await _newsRepo.getNewsHealdine();

    hideLoading();

    if (resulsts != null) {
      // converts the observable list to list
      articles = resulsts.obs;
    } else {
      print("No data received from the news repository");
    }
  }

  showLoading() {
    isLaoding.toggle();
  }

  hideLoading() {
    isLaoding.toggle();
  }
}
