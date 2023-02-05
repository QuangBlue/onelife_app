import 'package:get/get.dart';
import 'package:onelife_app/app/data/services/user_service.dart';
import 'package:onelife_app/app/routes/app_pages.dart';

abstract class Utils {
  static bool checkIsAuth() {
    final bool result =
        Get.find<UserService>().me.value.id?.isNotEmpty ?? false;

    if (!result) {
      Get.toNamed(Routes.LOGIN);
    }

    return result;
  }
}
