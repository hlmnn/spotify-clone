import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    rootNavigatorKey.currentState?.run((it) {
      locator<GitsInspector>().setNavigatorState(it);
    });
    init();
  }

  Future<void> init() async {
    await locator.allReady();
    await RemoteConfigHelper.init();
    setupTimer();
  }

  void setupTimer() {
    Timer(
      const Duration(seconds: 1),
      (() => context.goToHome()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.black,
      body: Center(
        child: Image.asset(
          GitsImages.spotifyLogo,
          width: context.widthPercentage(50),
        ),
      ),
    );
  }
}
