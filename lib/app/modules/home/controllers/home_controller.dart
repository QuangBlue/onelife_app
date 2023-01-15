import 'package:get/get.dart';
import 'package:onelife_app/app/data/providers/text_graphql.dart';

class HomeController extends GetxController with TextGraphQLProvider {
  double positionProgressBarPoint(double value) =>
      value * (Get.width - 64 - 24) / 10;
  double positionProgressBar(double value) =>
      value * (Get.width - 64 + 44) / 10;

  void handlePressScanQr() {}
  void handlePressVouhcer() {}
  void handlePressTopUp() {}
}
