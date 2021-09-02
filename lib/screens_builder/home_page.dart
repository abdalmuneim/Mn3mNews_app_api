import 'package:flutter/material.dart';
import '../widget_builder/myAppBarr.dart';
import '../get_some_data/listview_hori_data.dart';
import '../services/news_get_api.dart';
import '../widget_builder/newsTile.dart';
import '../data_model/category_model.dart';
import '../widget_builder/category_card.dart';

class HomePage extends StatefulWidget {
  static String routName = '/homePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    bool _loading;
  var newsList;

  List<CategoryModel> categories = <CategoryModel>[];

  void getNews() async {
    NewsGetAPI news = NewsGetAPI();
    await news.getNews();
    newsList = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _loading = true;
    // TODO: implement initState
    super.initState();

    categories = getCategoryHoris();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: myAppBar(),
        body: SafeArea(
          child: _loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        /// Categories
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          height: 70,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: categories.length,
                              itemBuilder: (context, index) {
                                return CategoryCard(
                                  imageAssetUrl:
                                      categories[index].imageAssetUrl,
                                  categoryName: categories[index].categoryName,
                                );
                              }),
                        ),
                        Align(
                          alignment: Alignment(-0.70, 0),
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: 'country: ',
                                style: TextStyle(color: Colors.black26)),
                            TextSpan(
                                text: 'EG',
                                style: TextStyle(color: Colors.blue)),
                          ])),
                        ),

                        /// News Article
                        Container(
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
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
