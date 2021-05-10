import 'package:get_it/get_it.dart';
import 'package:peersnest/helper/remote_config.dart';

GetIt locator = GetIt.instance;

Future setuplocator() async {
  var remoteconfigservice = await Remoteconfigservice.getInstance();
  locator.registerSingleton(remoteconfigservice);
}
