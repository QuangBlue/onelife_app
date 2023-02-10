import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:onelife_app/app/common/logger/app_logger.dart';
import 'package:onelife_app/app/common/utils/snackbar_util.dart';

class BaseResponse<T> {
  final T? data;
  final List<T>? dataList;
  final String? error;

  BaseResponse({
    this.data,
    this.dataList,
    this.error,
  });

  factory BaseResponse.fromJson(
      dynamic json, T Function(Map<String, dynamic>) parseData) {
    AppLogger.i(json.toString());

    if (json is List) {
      final List<dynamic> dataJson = json;
      final List<T> dataList = dataJson.map((e) => parseData(e)).toList();

      return BaseResponse(
        dataList: dataList,
      );
    } else {
      return BaseResponse(
        data: json != null ? parseData(json) : null,
      );
    }
  }

  factory BaseResponse.fromException(QueryResult<Object?> queryResult) {
    final String? stringError =
        queryResult.exception?.graphqlErrors.first.message;

    AppLogger.e(stringError);

    SnackbarUtil.showErrSnackbar(stringError);
    return BaseResponse(
      error: queryResult.exception?.graphqlErrors.first.message,
    );
  }
}
