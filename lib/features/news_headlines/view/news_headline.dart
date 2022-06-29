import 'package:flutter/material.dart';
import 'package:getx_news_api/core/widget/drawer.dart';

class NewsHeadline extends StatelessWidget {
  const NewsHeadline({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Headline"),
      ),
      drawer: getAppDrawer(),
      body: Container(),
    );
  }
}