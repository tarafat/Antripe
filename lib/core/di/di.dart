import 'package:antripe/core/network/dio/dio.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> diSetup() async {
  locator.allowReassignment = true;

  final dioInstance = DioSingleton.instance;
  dioInstance.create();
  locator.registerSingleton<DioSingleton>(dioInstance);
}
