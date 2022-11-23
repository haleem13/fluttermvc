import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttermvcsample/models/article.dart';
import 'package:fluttermvcsample/utils/custom_navigator.dart';
import 'package:fluttermvcsample/views/details.dart';
// import 'package:news_ui/models/news.dart';

class NewsCard extends StatelessWidget {
  final Articles articles;
  NewsCard({required this.articles});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CustomNavigator.nextScreen(context, Details(articles: articles));
      },
      child: Container(
        padding: EdgeInsets.all(25.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromRGBO(233, 233, 233, 1),
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          children: [
            Container(
              height: ScreenUtil().setHeight(100.0),
              width: ScreenUtil().setWidth(125.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromRGBO(233, 233, 233, 1),
                ),
                image: DecorationImage(
                    image: NetworkImage(
                      this.articles.urlToImage!,
                    ),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    this.articles.title!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    this.articles.description!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Color.fromRGBO(139, 144, 165, 1),
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    this.articles.publishedAt!.toString(),
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  Text(
                    this.articles.source!.name!,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color.fromRGBO(251, 89, 84, 1),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
