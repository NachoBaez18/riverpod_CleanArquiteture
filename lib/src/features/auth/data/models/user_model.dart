import 'dart:convert';

import 'package:app_cobro_v2/src/core/common/utils/typedef.dart';
import 'package:app_cobro_v2/src/features/auth/dominio/entities/user.dart';

class UserModel extends User {
  const UserModel({required super.id, required, required super.token});

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(jsonDecode(source) as DataMap);

  UserModel.fromMap(DataMap map)
      : this(id: map['id'] as int, token: map['token'] as String);

  const UserModel.empty() : this(token: 'token', id: 1);

  UserModel copyWith({int? id, String? token}) {
    return UserModel(
      token: token ?? this.token,
      id: id ?? this.id,
    );
  }

  DataMap toMap() => {'token': token, 'id': id};

  String toJson() => jsonEncode(toMap());
}
