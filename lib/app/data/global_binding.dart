import 'package:get/get.dart';
import 'package:onelife_app/app/common/logger/app_logger.dart';
import 'package:onelife_app/app/data/graphql_service.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    AppLogger.i('Initializing Global Binding');

    Get.lazyPut<GraphQLService>(() => GraphQLService());
  }
}
