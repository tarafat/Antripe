import 'package:antripe/core/error/data_source.dart';
import 'package:antripe/core/service/http_service.dart';
import 'package:antripe/features/user/data/models/contract.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/endpoints.dart';

part 'contract_repository.g.dart';

@riverpod
ContractRepository contract(Ref ref) {
  return ContractRepository.instance;
}

class ContractRepository {
  static final ContractRepository _singleton = ContractRepository._internal();
  ContractRepository._internal();
  static ContractRepository get instance => _singleton;

  Future<ContractResponse> getContract() async {
    try {
      Response response = await HttpService().getHttp(Endpoints.users());
      if (response.statusCode == 200) {
        return ContractResponse.fromJson(response.data);
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      throw ErrorHandler.handle(error).failure;
    }
  }
}
