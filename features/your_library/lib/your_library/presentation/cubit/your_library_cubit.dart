import 'package:core/core.dart';
import 'package:flutter/material.dart';

part 'your_library_state.dart';

class YourLibraryCubit extends GitsCubit<YourLibraryStateCubit> {
  YourLibraryCubit() : super(YourLibraryStateCubit());

  @override
  void initState(BuildContext context) async {}

  @override
  void initAfterFirstLayout(BuildContext context) {}

  @override
  List<BlocProvider> blocProviders(BuildContext context) => [];

  @override
  List<BlocListener> blocListeners(BuildContext context) => [];

  @override
  void dispose() {}
}
