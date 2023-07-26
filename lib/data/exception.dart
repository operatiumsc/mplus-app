import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mplus_app/data/failure.dart';

Failure handleException(ex) {
  if (ex is DioException) {
    throw ServerFailure(ex.message);
  } else if (ex is SocketException) {
    throw ConnectionFailure(ex.message);
  } else {
    throw UnexpectedFailure(ex.toString());
  }
}
