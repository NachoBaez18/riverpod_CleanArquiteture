import 'package:app_cobro_v2/src/core/data/local/storage_service.dart';
import 'package:app_cobro_v2/src/core/domain/providers/shared_prefs_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
  });
  test('storageServiceProvider is a StorageService', () {
    final provideContainer = ProviderContainer();

    addTearDown(provideContainer.dispose);

    expect(
      provideContainer.read(storageServiceProvider),
      isA<StorageService>(),
    );
  });
}
