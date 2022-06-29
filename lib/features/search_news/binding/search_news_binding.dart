import 'package:get/get.dart';
import 'package:getx_news_api/features/news_headlines/controller/news_headline_controller.dart';

class SearchNewsBinding extends Bindings {
  @override
  void dependencies() {
    // bind the two to the view
    // we dont need to put the ImplementationRepo here again coz it would be from the first one
    Get.put(NewsHeadlineController());
  }
}
