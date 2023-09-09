import 'package:app_cobro_v2/src/core/data/local/shared_prefs_storage_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/local/storage_service.dart';

part 'shared_prefs_service_provider.g.dart';

@riverpod
StorageService storageService(StorageServiceRef ref) {
  final SharedPrefsServices sharedPreferences = SharedPrefsServices();
  sharedPreferences.init();
  return sharedPreferences;
}
