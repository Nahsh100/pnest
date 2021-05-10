import 'package:firebase_remote_config/firebase_remote_config.dart';

class Remoteconfigservice {
  final RemoteConfig _remoteConfig;

  static Remoteconfigservice _instance;
  static Future<Remoteconfigservice> getInstance() async {
    if (_instance == null) {
      _instance = Remoteconfigservice(
        remoteConfig: await RemoteConfig.instance,
      );
    }

    return _instance;
  }

  Remoteconfigservice({RemoteConfig remoteConfig})
      : _remoteConfig = remoteConfig;
}
