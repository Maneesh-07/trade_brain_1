import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetConnectionController extends GetxController {
  var isConnected = true.obs;

  @override
  void onInit() {
    super.onInit();
    _checkConnection();
  }

  Future<void> _checkConnection() async {
    while (true) {
      bool connectionStatus = await InternetConnectionChecker().hasConnection;
      isConnected.value = connectionStatus;
      await Future.delayed(const Duration(seconds: 2));
    }
  }
}
