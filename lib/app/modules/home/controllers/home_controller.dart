import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project_latihan/app/modules/dashboard/views/dashboard_view.dart';
import 'package:project_latihan/app/modules/login/views/login_view.dart';

class HomeController extends GetxController {
  late Timer _pindah;
  final authToken = GetStorage();

  @override
  void onInit() {
    super.onInit();
    _pindah = Timer.periodic(
      const Duration(seconds: 60),
      (timer) => authToken.read('token') == null
          ? Get.off(
              () => const LoginView(),
              transition: Transition.leftToRight,
            )
          : Get.off(() => const DashboardView()),
    );

    @override
    void onReady() {
      super.onReady();
    }

    @override
    void onClose() {
      super.onClose();
      _pindah.cancel();
    }
  }
}
