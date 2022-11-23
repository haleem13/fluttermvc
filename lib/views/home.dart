import 'package:flutter/material.dart';
import 'package:fluttermvcsample/models/article.dart';
import 'package:fluttermvcsample/controller/article_data_controller.dart';
import 'package:fluttermvcsample/widgets/news_card.dart';
import 'package:fluttermvcsample/widgets/search_widget.dart';
import 'package:provider/provider.dart';

import '../locators.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    locator<ArticleDataService>().fetchArticles();
  }

  @override
  Widget build(BuildContext context) {
    List<Articles>? articles =
        Provider.of<ArticleDataService>(context).articles;
    bool isLoading = Provider.of<ArticleDataService>(context).isLoading;
    return Scaffold(
      appBar: AppBar(
        title: Text('MVC Demo'),
      ),
      body: (isLoading)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                SearchWidget(
                    text: 'Search',
                    onChanged: (text) {
                      locator<ArticleDataService>()
                          .fetchArticles(query: text.toLowerCase());
                    },
                    hintText: 'Search for the title'),
                Expanded(
                  child: ListView.builder(
                      itemCount: articles!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return NewsCard(articles: articles[index]);
                      }),
                ),
              ],
            ),
    );
  }
}
