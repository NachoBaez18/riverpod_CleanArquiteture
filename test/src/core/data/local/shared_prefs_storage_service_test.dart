import 'package:app_cobro_v2/src/core/data/local/shared_prefs_storage_service.dart';
import 'package:app_cobro_v2/src/core/data/local/storage_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../fixture/data/user_map.dart';

void main() {
  late StorageService storageService;

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({'key': ktestUserMap});
    storageService = SharedPrefsServices();
  });

  group('SharedPreferencesStorageServicesTest\n', () {
    test('when the prefs is not initialized the hasInitialized should be FALSE',
        () async {
      expect(storageService.hasInitialized, false);
      storageService.init();
    });

    test('Should perform the CRUD operation with SharedPreferences', () async {
      //?obtenemos el dato
      final data = await storageService.get('key');
      expect(data, ktestUserMap);
      //?vemos si existe ese key
      final hasData = await storageService.has('key');
      expect(hasData, true);
      //?Eliminamos el key
      final removeData = await storageService.remove('key');
      expect(removeData, true);
      //?ya que eliminamos vemos si existe otra vez
      final hasData2 = await storageService.has('key');
      expect(hasData2, false);
      //?guadamos un key nuevo
      final saved = await storageService.set('key', ktestUserMap.toString());
      expect(saved, true);
      //?verificamos si se registro
      final hasData3 = await storageService.has('key');
      expect(hasData3, true);
      //?Limpiamos todo el storage
      await storageService.clear();
      final hasData4 = await storageService.has('key');
      expect(hasData4, false);
    });
  });
}
