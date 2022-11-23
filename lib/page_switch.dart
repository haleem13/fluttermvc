import 'package:flutter/material.dart';
import 'package:fluttermvcsample/views/bookmark.dart';
import 'package:fluttermvcsample/views/home.dart';
import 'package:fluttermvcsample/widgets/bottom_tabbar.dart';

class PageSwitch extends StatefulWidget {
  @override
  _PageSwitchState createState() => _PageSwitchState();
}

class _PageSwitchState extends State<PageSwitch> {
  int currentIndex = 0;

  void changeCurrentIndex(int newIndex) {
    setState(() {
      currentIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(
        changeIndex: changeCurrentIndex,
        currentIndex: currentIndex,
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  child: [
                    Home(),
                    Bookmark(),
                  ][currentIndex],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
