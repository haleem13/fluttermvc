import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttermvcsample/models/article.dart';
import 'package:fluttermvcsample/page_switch.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'locators.dart';
import 'controller/article_data_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ArticlesAdapter());

  Hive.registerAdapter(SourceAdapter());
  await Hive.openBox<Articles>('bookmark_box');

  ///Set preferred orientation to portrait
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  setupLocators();

  runApp(
    MultiProvider(
      /// List of provider, the UI updates when `notifyListeners()` is called
      /// on the service classes
      /// learn more: https://pub.dev/packages/provider
      providers: [
        ChangeNotifierProvider(create: (_) => locator<ArticleDataService>()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  static const _primaryColor = 0xFF80CBC4;

  static const MaterialColor _primary = MaterialColor(
    _primaryColor,
    <int, Color>{
      50: Color(0xFFFDFEFF),
      100: Color(0xFFFDFEFE),
      200: Color(0xFFE0F2F1),
      300: Color(0xFFB2DFDB),
      400: Color(0xFFB2DFDB),
      500: Color(_primaryColor),
      600: Color(0xFF4DB6AC),
      700: Color(0xFF26A69A),
      800: Color(0xFF009688),
      900: Color(0xFF00897B),
    },
  );

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(375, 812),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'MVC Demo',
            theme: ThemeData(
              primarySwatch: _primary,
            ),
            initialRoute: '/',
            routes: {
              "/": (_) => PageSwitch(),
            },
          );
        });
  }
}
