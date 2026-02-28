// ignore_for_file: constant_identifier_names
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:antripe/core/utils/toast.dart';

import 'error_response.dart';

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  ID_EXISTS_VERIFIED,
  ID_EXISTS_NOT_VERIFIED,
  DEFAULT,
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.SUCCESS:
        return Failure(ResponseCode.SUCCESS, ResponseMessage.SUCCESS);
      case DataSource.NO_CONTENT:
        return Failure(ResponseCode.NO_CONTENT, ResponseMessage.NO_CONTENT);
      case DataSource.BAD_REQUEST:
        return Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST);
      case DataSource.FORBIDDEN:
        return Failure(ResponseCode.FORBIDDEN, ResponseMessage.FORBIDDEN);
      case DataSource.UNAUTORISED:
        return Failure(ResponseCode.UNAUTORISED, ResponseMessage.UNAUTORISED);
      case DataSource.NOT_FOUND:
        return Failure(ResponseCode.NOT_FOUND, ResponseMessage.NOT_FOUND);
      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(ResponseCode.INTERNAL_SERVER_ERROR, ResponseMessage.INTERNAL_SERVER_ERROR);
      case DataSource.CONNECT_TIMEOUT:
        return Failure(ResponseCode.CONNECT_TIMEOUT, ResponseMessage.CONNECT_TIMEOUT);
      case DataSource.CANCEL:
        return Failure(ResponseCode.CANCEL, ResponseMessage.CANCEL);
      case DataSource.RECIEVE_TIMEOUT:
        return Failure(ResponseCode.RECIEVE_TIMEOUT, ResponseMessage.RECIEVE_TIMEOUT);
      case DataSource.SEND_TIMEOUT:
        return Failure(ResponseCode.SEND_TIMEOUT, ResponseMessage.SEND_TIMEOUT);
      case DataSource.CACHE_ERROR:
        return Failure(ResponseCode.CACHE_ERROR, ResponseMessage.CACHE_ERROR);
      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(ResponseCode.NO_INTERNET_CONNECTION, ResponseMessage.NO_INTERNET_CONNECTION);
      case DataSource.ID_EXISTS_VERIFIED:
        return Failure(ResponseCode.ALREADY_EXISTS, ResponseMessage.ID_EXISTS_VERIFIED);
      case DataSource.ID_EXISTS_NOT_VERIFIED:
        return Failure(ResponseCode.EXISTS_NOT_VERIFIED, ResponseMessage.ID_EXISTS_NOT_VERIFIED);
      case DataSource.DEFAULT:
        return Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
    }
  }
}

final class Failure {
  final int resonseCode;
  final String responseMessage;
  Failure(this.resonseCode, this.responseMessage) {
    log("Getting called:$responseMessage");
  }
}

final class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      failure = _handleError(error);
    } else {
      log(error.toString());
      // default error
      failure = DataSource.DEFAULT.getFailure();
    }
  }

  Failure _handleError(DioException error) {
    log(error.type.toString());
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return DataSource.CONNECT_TIMEOUT.getFailure();
      case DioExceptionType.sendTimeout:
        return DataSource.SEND_TIMEOUT.getFailure();
      case DioExceptionType.receiveTimeout:
        return DataSource.RECIEVE_TIMEOUT.getFailure();
      case DioExceptionType.badResponse:
        if (error.response != null && error.response?.statusCode != null && error.response?.statusMessage != null) {
          dynamic erro = error.response!.data["helper"]["message"];
          if (erro.runtimeType == String) {
            ToastUtil.showErrorToastUithDismiss(erro);
            return Failure(error.response?.statusCode ?? 0, error.response!.data["message"] ?? "");
          } else {
            Map<String, dynamic> errors = error.response!.data["errors"] ?? {"message": error.response!.data["message"]};
            List<String> errorMessages = [];
            if (errors.containsKey("message")) {
              errorMessages.add(errors["message"]);
            } else {
              errorMessages = errors.values.expand((value) => value).cast<String>().toList();
            }
            for (String errorMessage in errorMessages) {
              if (error.response?.statusCode != 401) {
                ToastUtil.showErrorToast(errorMessage);
              }
            }
            if (error.response?.statusCode == 401) {
              // totalDataClean().then((value) {
              //   DioSingleton.cancelAllRequests();
              //   NavigationService.navigateToReplacement(Routes.loading);
              // });
            }
            return Failure(error.response?.statusCode ?? 0, errorMessages.join(',\n'));
          }
        } else {
          return DataSource.DEFAULT.getFailure();
        }
      case DioExceptionType.cancel:
        return DataSource.CANCEL.getFailure();
      default:
        return DataSource.DEFAULT.getFailure();
    }
  }
}
