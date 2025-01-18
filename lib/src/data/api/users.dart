import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tio/tio.dart';

import '../../data.dart';

part 'users.g.dart';

@Riverpod(keepAlive: true)
UsersApi usersApi(Ref ref) => throw UnimplementedError();

abstract class UsersApi {
  const UsersApi();

  Future<TioResponse<List<User>, void>> users();

  Future<TioResponse<User, void>> user(int id);
}
