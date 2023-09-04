//? de que depende la clase
//*Depende del UserDataRepository
//?Como puedo crear una version false de ese dependencia
//* Usar Mocktail
//?Como tenemos control de la dependencia
//* usando Mocktail

import 'package:app_cobro_v2/src/features/auth/dominio/repositories/user_data_repository.dart';
import 'package:app_cobro_v2/src/features/auth/dominio/use_case/login.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../fixture/data/login_params_map.dart';

class MockLoginRepo extends Mock implements UserDataRepository {}

void main() {
  late Login usecase;
  late UserDataRepository repository;

  setUp(() {
    repository = MockLoginRepo();
    usecase = Login(repository);
    registerFallbackValue(loginParams);
  });

  test('should call the [Repository.login]', () async {
    //?Vemos lo que necesitamos

    when(
      () => repository.login(
        params: any(named: 'params'),
      ),
    ).thenAnswer((_) async => const Right(null));

    //?activamos lo que vamos a probar

    final result = await usecase(loginParams);

    //? verficamos que haga lo que buscamos

    expect(result, equals(const Right<dynamic, void>(null)));
    verify(
      () => repository.login(params: loginParams),
    ).called(1);

    verifyNoMoreInteractions(repository);
  });
}
