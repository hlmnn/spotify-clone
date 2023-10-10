import 'package:core/core.dart';

import 'presentation/cubit/search_cubit.dart';

void setupLocatorSearch() {
  // *Cubit
  locator.registerFactory(() => SearchCubit());
}
