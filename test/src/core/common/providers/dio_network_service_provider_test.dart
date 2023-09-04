import 'package:app_cobro_v2/src/core/data/providers/dio_network_service_provider.dart';
import 'package:app_cobro_v2/src/core/data/remote/network_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('dioNetworkServiceProvider is a NetworkService', () {
    final provideContainer = ProviderContainer();

    addTearDown(provideContainer.dispose);

    expect(
      provideContainer.read(netwokServiceProvider),
      isA<NetworkService>(),
    );
  });
}
