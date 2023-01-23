import 'package:get/get.dart';

import '../../modules/home/controllers/home_controller.dart';

class NavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    // Get.lazyPut<Page2Controller>(
    //       () => Page2Controller(),
    // );
    // Get.lazyPut<Page3Controller>(
    //       () => Page3Controller(),
    // );
    // Get.lazyPut<ProfileController>(
    //       () => ProfileController(),
    // );
  }
}
