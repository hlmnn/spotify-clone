import 'package:core/core.dart';

import 'presentation/cubit/your_library_cubit.dart';

void setupLocatorYourLibrary() {
  // *Cubit
  locator.registerFactory(() => YourLibraryCubit());
}
