import 'package:get/get.dart';
import 'package:onelife_app/app/data/providers/text_graphql.dart';

class HomeController extends GetxController with TextGraphQLProvider {
  double positionProgressBarPoint(double value) =>
      value * (Get.width - 66 - 20) / 10;
  double positionProgressBar(double value) => value * (Get.width - 46) / 10;

  void handlePressScanQr() {}
  void handlePressVouhcer() {}
  void handlePressTopUp() {}
}
