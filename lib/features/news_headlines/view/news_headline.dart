import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_news_api/core/widget/drawer.dart';
import 'package:getx_news_api/features/news_headlines/controller/news_headline_controller.dart';

class NewsHeadline extends StatelessWidget {
  const NewsHeadline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewsHeadlineController>();
    return Scaffold(
      appBar: AppBar(
        title: Text("News Headline"),
      ),
      drawer: getAppDrawer(),
      body: Obx(() {
        return controller.isLaoding.isTrue
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                margin: EdgeInsets.all(12.0),
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Image.network(controller.articles[index].urlToImage),
                          const SizedBox(height: 8,),
                          Text(controller.articles[index].title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),),
                          const SizedBox(height: 8,),
                          Text(controller.articles[index].author, style:TextStyle(fontSize: 16, fontWeight: FontWeight.w300)),
                          const SizedBox(height: 4,),
                          Text(controller.articles[index].description, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),)
                        ],
                      ); 
                    },
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: controller.articles.length),
              );
      }),
    );
  }
}
