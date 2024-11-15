import 'package:get/get.dart';
import 'package:trogon_e_coomerce/model/product_model.dart';

import 'package:trogon_e_coomerce/view/home/screen_home.dart';
import 'package:trogon_e_coomerce/view/pruduct/screen_product.dart';

class AppRoutes {
  //                      \\
  static goFromSplashScreen() async {
    Future.delayed(
      const Duration(
        seconds: 3,
      ),
    ).then(
      (value) {
        Get.off(
          const ScreenHome(),
          transition: Transition.fadeIn,
          duration: const Duration(seconds: 3),
        );
      },
    );
  }

  static gotoProductScreen({required ProductModel product}) {
    Get.to(
      () => ScreenProduct(
        product: product,
      ),
      transition: Transition.fadeIn,
      duration: const Duration(seconds: 1),
    );
  }

  static popScreen() {
    Get.back();
  }
}
