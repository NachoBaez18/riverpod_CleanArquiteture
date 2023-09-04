import 'package:app_cobro_v2/src/core/data/remote/dio_network_service.dart';
import 'package:app_cobro_v2/src/core/data/remote/network_service.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_network_service_provider.g.dart';

@riverpod
NetworkService netwokService(NetwokServiceRef ref) {
  final Dio dio = Dio();

  return DioNetworkService(dio);
}
