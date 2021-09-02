import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widget_builder/myAppBarr.dart';
import '../services/news_get_api.dart';
import '../widget_builder/newsTile.dart';

class CategoryNews extends StatefulWidget {
  final String newsCategory;

  CategoryNews({ this.newsCategory});

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  var newsList;
  bool _loading = true;

  @override
  void initState() {
    getNews();
    // TODO: implement initState
    super.initState();
  }

  void getNews() async {
    NewsGetAPIForCategory news = NewsGetAPIForCategory();
    await news.getNewsForCategory(widget.newsCategory);
    newsList = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: mySharedAppBar(),
        body: _loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Container(
                  child: Container(
                    margin: EdgeInsets.only(top: 16),
                    child: ListView.builder(
                        itemCount: newsList.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return NewsTile(
                            imgUrl: newsList[index].urlToImage ?? "",
                            title: newsList[index].title ?? "",
                            desc: newsList[index].description ?? "",
                            content: newsList[index].content ?? "",
                            postUrl: newsList[index].articleUrl ?? "",
                          );
                        }),
                  ),
                ),
              ),
      ),
    );
  }
}
