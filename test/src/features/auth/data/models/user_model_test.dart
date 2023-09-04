import 'dart:convert';

import 'package:app_cobro_v2/src/core/common/utils/typedef.dart';
import 'package:app_cobro_v2/src/features/auth/data/models/user_model.dart';
import 'package:app_cobro_v2/src/features/auth/dominio/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixture/fixture_reader.dart';

void main() {
  const tModel = UserModel.empty();
  test('should be a subclass of [User] entity', () {
    expect(tModel, isA<User>());
  });

  final tJson = fixture('user.json');
  final tMap = jsonDecode(tJson) as DataMap;
  group('fromMap', () {
    test('should return a [UserModel] with the right data', () {
      //?Accion a realizar
      final result = UserModel.fromMap(tMap);
      expect(result, tModel);
    });
  });
  group('formJson', () {
    test('should return a [UserModel] with the right data', () {
      //?Accion a realizar
      final result = UserModel.fromJson(tJson);
      expect(result, tModel);
    });
  });

  group('toMap', () {
    test('should return a [Map] with the right data', () {
      final result = tModel.toMap();

      expect(result, equals(tMap));
    });
  });

  group('toJson', () {
    test('should return a [Json] with the right data', () {
      final result = tModel.toJson();
      final tJson = jsonEncode({"token": "token", "id": 1});

      expect(result, equals(tJson));
    });
  });

  group('copyWith', () {
    test('should return a [Usermodel] with different data', () {
      final result = tModel.copyWith(token: 'token nuevo');

      expect(result.token, equals('token nuevo'));
    });
  });
}
