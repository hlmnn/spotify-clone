import 'package:core/src/environment.dart';
import 'package:dependency_manager/dependency_manager.dart'
    show FirebaseRemoteConfig, FlutterSecureStorage;
import 'package:gits_library/gits_library.dart';

import 'global_variable.dart';

void setupLocatorFeatureCore() {
  locator.registerLazySingleton(() => const FlutterSecureStorage());
  locator.registerLazySingleton(() => FirebaseRemoteConfig.instance);
  locator.registerLazySingleton(
    () => GitsInspector(
      showInspectorOnShake: Environment.isNotProd,
      showNotification: Environment.isNotProd,
      saveInspectorToLocal: Environment.isNotProd,
    ),
  );
  locator.registerLazySingleton(
    () => GitsHttp(
      timeout: 30000,
      showLog: Environment.isNotProd,
      gitsInspector: locator(),
      // authTokenOption: AuthTokenOption(
      //   typeHeader: 'Authorization',
      //   prefixHeader: 'Bearer',
      //   getToken: () => FlutterSecureStorageHelper.getToken(),
      //   authCondition: (request, response) =>
      //       request.url == GitsEndpoints.login,
      //   onAuthTokenResponse: (response) async {
      //     final map = jsonDecode(response.body);
      //     await FlutterSecureStorageHelper.saveToken(map['token']);
      //     await FlutterSecureStorageHelper.saveRefreshToken(
      //       map['refresh_token'],
      //     );
      //   },
      //   clearCondition: (request, response) =>
      //       request.url == GitsEndpoints.logout,
      //   onClearToken: () => FlutterSecureStorageHelper.removeToken(),
      //   excludeEndpointUsageToken: [
      //     GitsEndpoints.login,
      //     GitsEndpoints.register,
      //   ],
      // ),
      // refreshTokenOption: RefreshTokenOption(
      //   method: RefreshTokenMethod.post,
      //   url: GitsEndpoints.refreshToken,
      //   condition: (request, response) =>
      //       request.url != GitsEndpoints.login && response.statusCode == 401,
      //   getBody: () async {
      //     final refreshToken =
      //         await FlutterSecureStorageHelper.getRefreshToken();

      //     return {
      //       'refresh_token': refreshToken ?? '',
      //     };
      //   },
      //   onResponse: (response) async {
      //     final map = jsonDecode(response.body);
      //     await FlutterSecureStorageHelper.saveRefreshToken(map['token']);
      //   },
      // ),
    ),
  );
}
