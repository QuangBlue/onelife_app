import 'package:get/state_manager.dart';
import 'package:onelife_app/app/data/models/me_model.dart';

class UserService extends GetxService {
  final Rx<MeModel> me = MeModel().obs;
}
