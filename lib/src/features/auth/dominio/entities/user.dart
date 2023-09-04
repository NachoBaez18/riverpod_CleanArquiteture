import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({required this.token, required this.id});

  final String token;
  final int id;

  const User.empty() : this(token: 'token', id: 1);

  @override
  List<Object?> get props => [token, id];
}
