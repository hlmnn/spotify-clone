import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../cubit/home_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with GitsStatePage<HomePage, HomeCubit> {
  @override
  HomeCubit setCubit() => locator<HomeCubit>();

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.black,
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<HomeCubit>().onAddPressed(context),
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(GitsImages.spotifyLogo, width: context.widthPercentage(50)),
            const GitsSpacing.vertical24(),
            GitsText.titleLarge(context.s.awesome),
            const GitsSpacing.vertical16(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GitsText.bodyMedium(context.s.language),
                const GitsSpacing.horizontal16(),
                DropdownButton<Locale>(
                  isDense: true,
                  value: context.selectLocale,
                  items: const [
                    DropdownMenuItem(
                      value: Locale('en'),
                      child: Text('English'),
                    ),
                    DropdownMenuItem(
                      value: Locale('id'),
                      child: Text('Indonesia'),
                    ),
                  ],
                  onChanged: (value) {
                    if (value != null) context.changeLocale(value);
                  },
                ),
              ],
            ),
            const GitsSpacing.vertical16(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GitsText.bodyMedium(context.s.theme),
                const GitsSpacing.horizontal16(),
                DropdownButton<ThemeMode>(
                  isDense: true,
                  value: context.selectThemeMode,
                  items: const [
                    DropdownMenuItem(
                      value: ThemeMode.light,
                      child: Text('Ligth'),
                    ),
                    DropdownMenuItem(
                      value: ThemeMode.dark,
                      child: Text('Dark'),
                    ),
                  ],
                  onChanged: (value) {
                    if (value != null) context.changeThemeMode(value);
                  },
                ),
              ],
            ),
            const GitsSpacing.vertical16(),
            GitsText.bodyMedium(
              'Firebase Flavor: ${RemoteConfigHelper.getFlavor()}',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
