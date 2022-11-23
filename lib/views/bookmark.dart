import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fluttermvcsample/models/article.dart';
import 'package:fluttermvcsample/widgets/news_card.dart';

import 'package:hive_flutter/hive_flutter.dart';

class Bookmark extends StatelessWidget {
  const Bookmark({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookmarks'),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<Articles>('bookmark_box').listenable(),
        builder: (context, Box box, child) {
          List<Articles> data = List.from(box.values);

          return ListView(
            children: [
              if (data.isNotEmpty)
                ...data.map((articles) => Stack(
                      children: [
                        NewsCard(articles: articles),
                        Positioned(
                            right: 0,
                            child: IconButton(
                                onPressed: () {
                                  box.delete(articles.url);
                                },
                                icon: Icon(FlutterIcons.close_ant)))
                      ],
                    ))
              else
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Nothing to Show',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                        ),
                      )),
                )
            ],
          );
        },
      ),
    );
  }
}
