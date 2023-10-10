//
// Generated file. Edit just you manually add or delete a feature.
//

import 'package:auth/locator.dart';
import 'package:core/core.dart';
import 'package:home/locator.dart';

import 'routes/routes.dart';
import 'package:search/locator.dart';
import 'package:your_library/locator.dart';

void setupLocator() {
  locator.registerLazySingleton(() => Routes.router);
  setupLocatorFeatureCore();
  setupLocatorFeatureAuth();

  setupLocatorFeatureHome();

  setupLocatorFeatureSearch();
  setupLocatorFeatureYourLibrary();
}
