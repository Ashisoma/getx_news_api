import 'package:get/get.dart';
import 'package:getx_news_api/core/model/article.dart';
import 'package:getx_news_api/core/repository/news_repo.dart';
import 'package:getx_news_api/core/repository/news_repo_impl.dart';


class NewsHeadlineController extends GetxController{
  late NewsRepo _newsRepo;

  NewsHeadlineController(){
    _newsRepo = Get.find<NewsRepoImpl>();
    loadNewsLine();
  }

  RxBool isLoading = false.obs;

  RxList<Article> articles = RxList();

  loadNewsLine() async{

    showLoading();

    final result = await _newsRepo.getNewsHeadline();

    hideLoading();

    if(result!= null){
      articles = result.obs;
    }else{
      print("No data recieved");
    }
  }

  showLoading(){
    isLoading.toggle();
  }

  hideLoading(){
    isLoading.toggle();
  }
}