import 'package:get/get.dart';
import 'package:getx_news_api/core/repository/news_repo_implementation.dart';
import 'package:getx_news_api/features/news_headlines/controller/news_headline_controller.dart';

class NewsHeadlineBinding extends Bindings {
  @override
  void dependencies() {
    // bind the two to the view
    Get.put(NewsReposirotyImpl());
    Get.put(NewsHeadlineController());
  }
}
