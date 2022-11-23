import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttermvcsample/models/article.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:share_plus/share_plus.dart';

class DetailsScreenHeader extends StatelessWidget {
  final Articles articles;
  const DetailsScreenHeader({Key? key, required this.articles});
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Hive.box<Articles>('bookmark_box').listenable(),
        builder: (context, Box box, snapshot) {
          // final List<Articles> data = List.from(box.values);
          return Container(
            height: ScreenUtil().setHeight(80.0),
            padding: EdgeInsets.only(bottom: 20.0, left: 16.0, right: 16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(169, 176, 185, 0.42),
                  spreadRadius: 0,
                  blurRadius: 2,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(FlutterIcons.chevron_left_fea),
                  Expanded(
                    child: Text(
                      articles.title!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.ptSans(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 40.0,
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    onPressed: () async {
                      if (box.containsKey(articles.url)) {
                        box.delete(articles.url);
                      } else {
                        await Hive.box<Articles>('bookmark_box')
                            .put(articles.url, articles);
                      }
                    },
                    icon: Icon(
                      box.containsKey(articles.url)
                          ? FlutterIcons.bookmark_faw
                          : FlutterIcons.bookmark_fea,
                    ),
                    iconSize: 20,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    onPressed: () {
                      Share.share(articles.url!);
                    },
                    icon: Icon(
                      FlutterIcons.share_2_fea,
                    ),
                    iconSize: 20,
                  )
                ],
              ),
            ),
          );
        });
  }
}
