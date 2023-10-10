import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../cubit/your_library_cubit.dart';

class YourLibraryPage extends StatefulWidget {
  const YourLibraryPage({Key? key}) : super(key: key);

  @override
  State<YourLibraryPage> createState() => _YourLibraryPageState();
}

class _YourLibraryPageState extends State<YourLibraryPage>
    with GitsStatePage<YourLibraryPage, YourLibraryCubit> {
  @override
  YourLibraryCubit setCubit() => locator<YourLibraryCubit>();

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('YourLibrary')),
      body: Container(),
    );
  }
}
