import 'package:app_cobro_v2/src/main/app.dart';
import 'package:app_cobro_v2/src/main/app_env.dart';
import 'package:app_cobro_v2/src/main/observers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => mainCommon(AppEnviroment.PROD);

Future<void> mainCommon(AppEnviroment enviroment) async {
  WidgetsFlutterBinding.ensureInitialized();
  EnvInfo.initialize(enviroment);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
    ),
  );
  runApp(ProviderScope(observers: [
    Observers(),
  ], child: MyApp()));
}
