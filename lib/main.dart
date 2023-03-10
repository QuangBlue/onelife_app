import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:onelife_app/app/common/logger/app_logger.dart';
import 'package:onelife_app/app/data/global_binding.dart';

import 'app/routes/app_pages.dart';

void main() {
  runZonedGuarded(() async {
    await GetStorage.init();
    await initHiveForFlutter();
    runApp(
      GetMaterialApp(
        title: "Application",
        initialRoute: AppPages.INITIAL,
        initialBinding: GlobalBinding(),
        getPages: AppPages.routes,
        defaultTransition: Transition.fade,
      ),
    );
  }, (error, stackTrace) {
    AppLogger.e({error, stackTrace});
  });
}
