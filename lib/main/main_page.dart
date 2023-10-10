import 'package:core/core.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key, required this.child});

  final Widget child;

  int selectedPage(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    if (location.startsWith(PathRoutes.home)) {
      return 0;
    }
    if (location.startsWith(PathRoutes.search)) {
      return 1;
    }
    if (location.startsWith(PathRoutes.yourLibrary)) {
      return 2;
    }
    return 0;
  }

  void onNavigationBarPressed(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.goToHome();
        break;
      case 1:
        context.goToSearch();
        break;
      case 2:
        context.goToYourLibrary();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const ValueKey(GitsDataTesId.pageMain),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: context.color.grey,
        selectedItemColor: context.color.primary,
        backgroundColor: context.color.black,
        currentIndex: selectedPage(context),
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_filled),
            label: context.s.home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search),
            label: context.s.search,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.my_library_books_outlined),
            label: context.s.yourLibrary,
          ),
        ],
        onTap: (index) => onNavigationBarPressed(context, index),
      ),
    );
  }
}
