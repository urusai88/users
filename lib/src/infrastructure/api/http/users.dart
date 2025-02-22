import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tio/tio.dart';

import '../../../data.dart';
import '../../../services.dart';

part 'users.g.dart';

@riverpod
UsersHttpApi usersHttpApi(Ref ref) => UsersHttpApi(tio: ref.read(tioProvider));

class UsersHttpApi implements UsersApi {
  const UsersHttpApi({
    required this.tio,
  });

  final Tio<void> tio;

  @override
  Future<TioResponse<List<User>, void>> users() =>
      tio.get<User>('/users').many();

  @override
  Future<TioResponse<User, void>> user(int id) =>
      tio.get<User>('/users/$id').one();
}
