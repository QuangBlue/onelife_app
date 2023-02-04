import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:onelife_app/app/common/logger/app_logger.dart';
import 'package:onelife_app/app/data/graphql_service.dart';
import 'package:onelife_app/app/data/models/popular_category_model.dart';
import 'package:onelife_app/app/data/providers/graphql_strings.dart';

class TextGraphQLProvider {
  final GraphQLClient qlClient = Get.find<GraphQLService>().qlClient;

  Future<void> textFunc() async {
    QueryResult queryResult = await qlClient.query(
      QueryOptions(
        fetchPolicy: FetchPolicy.networkOnly,
        document: gql(
          popularCategory,
        ),
      ),
    );

    AppLogger.i(queryResult.data?['popularCategory'][0]['name']);

    final ListPopularCategory x =
        ListPopularCategory.fromJson(queryResult.data!);

    AppLogger.e(x.popularCategory!.first.name);
  }
}
