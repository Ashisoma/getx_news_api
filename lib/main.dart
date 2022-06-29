import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:getx_news_api/features/news_headlines/binding/news_headline_binding.dart';
import 'package:getx_news_api/features/news_headlines/view/news_headline.dart';
import 'package:getx_news_api/features/search_news/binding/search_news_binding.dart';
import 'package:getx_news_api/features/search_news/view/search_news_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
     getPages:[
      GetPage(name: "/news_headline", page: () => NewsHeadline(), binding: NewsHeadlineBinding()),
      GetPage(name: "/search_news_view", page: () => SearchNewsView(), binding: SearchNewsBinding())
     ],
     initialRoute: "/news_headline",
    );
  }
}
