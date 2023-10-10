import 'package:core/core.dart';
import 'package:your_library/your_library/presentation/pages/your_library_page.dart';

List<RouteBase> yourLibraryRoutes = [
  GoRoute(
    path: PathRoutes.yourLibrary,
    pageBuilder: (context, state) =>
        const NoTransitionPage(child: YourLibraryPage()),
  ),
];
