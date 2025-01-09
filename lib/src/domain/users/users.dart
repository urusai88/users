import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tio/tio.dart';

import '../../data.dart';
import '../../infrastructure.dart';

part 'users.g.dart';

@Riverpod(keepAlive: true)
Future<List<User>> users(Ref ref) async {
  try {
    return await ref.read(usersHttpApiProvider).users().unwrap();
  } on DioException catch (e) {
    throw 'Connection error';
  }
}

@Riverpod(keepAlive: true)
Future<User> user(Ref ref, int id) =>
    ref.read(usersHttpApiProvider).user(id).unwrap();
