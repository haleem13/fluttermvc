import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttermvcsample/models/article.dart';
import 'package:fluttermvcsample/utils/custom_navigator.dart';
import 'package:fluttermvcsample/views/webview.dart';

import 'package:fluttermvcsample/widgets/details_screen_header.dart';

class Details extends StatelessWidget {
  final Articles articles;
  const Details({Key? key, required this.articles}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          CustomNavigator.nextScreen(
              context, WebViewScreen(url: articles.url!));
        },
        child: Icon(FlutterIcons.navigation_fea),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            DetailsScreenHeader(articles: articles),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 30.0,
                      ),
                      Text(
                        articles.title!,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        articles.description!,
                        style: TextStyle(
                          height: 1.7,
                          color: Color.fromRGBO(139, 144, 165, 1),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        height: ScreenUtil().setHeight(210.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              articles.urlToImage.toString(),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        articles.author == null
                            ? "No Author"
                            : articles.author!,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Published ${articles.publishedAt}",
                        style: TextStyle(
                          height: 1.7,
                          color: Color.fromRGBO(139, 144, 165, 1),
                        ),
                      ),
                      Text(
                        "Source ${articles.source!.name!}",
                        style: TextStyle(
                          height: 1.7,
                          color: Color.fromRGBO(139, 144, 165, 1),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        articles.content!,
                        style: TextStyle(
                          height: 1.7,
                          color: Color.fromRGBO(139, 144, 165, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
