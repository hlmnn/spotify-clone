import 'package:core/core.dart';
import 'package:flutter/material.dart';

part 'search_state.dart';

class SearchCubit extends GitsCubit<SearchStateCubit> {
  SearchCubit() : super(SearchStateCubit());

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
