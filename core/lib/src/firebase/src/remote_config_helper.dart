import 'package:dependency_manager/dependency_manager.dart';

import '../../global_variable.dart';

abstract final class RemoteConfigHelper {
  static final _remoteConfig = locator<FirebaseRemoteConfig>();

  static Future<void> init() async {
    await _remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(hours: 1),
      ),
    );

    await _remoteConfig.setDefaults(const {
      "flavor": 'none',
    });

    await _remoteConfig.fetchAndActivate();
  }

  static String getFlavor() => _remoteConfig.getString('flavor');
}
