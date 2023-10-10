import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../cubit/search_cubit.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with GitsStatePage<SearchPage, SearchCubit> {
  @override
  SearchCubit setCubit() => locator<SearchCubit>();

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.black,
      appBar: AppBar(
        title: GitsText.titleLarge(context.s.search,
          style: TextStyle(
            color: context.color.white,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: context.color.black,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(context.heightPercentage(7)),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            margin: const EdgeInsets.only(bottom: 5),
            child: const GitsSearch(hintText: 'What do you want to listen to?'),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GitsSpacing.vertical24(),
                GitsText.bodyLarge('Browse All',
                  style: TextStyle(
                    color: context.color.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const GitsSpacing.vertical16(),
                SizedBox(
                  height: (8 / 2) * context.widthPercentage(50),
                  child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                      ),
                      itemCount: 8,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {},
                          child: Container(
                            height: context.widthPercentage(50),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(GitsSizes.s8),
                            ),
                            padding: const EdgeInsets.all(10.0),
                            child: GitsText.bodyLarge('Genre',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: context.color.white,
                              ),
                            ),
                          ),
                        );
                      }
                  ),
                ),

              ],
            )
        ),
      ),
    );
  }
}
