import 'package:get_it/get_it.dart';

import 'controller/article_data_controller.dart';

/// Locators to get instances of classes mostly singletons
GetIt locator = GetIt.I;

/// needs to be called at in the main
/// it creates the instances of services
void setupLocators() {
  locator.registerLazySingleton<ArticleDataService>(
    () => ArticleDataService(),
  );
}
