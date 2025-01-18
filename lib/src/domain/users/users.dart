import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tio/tio.dart';

import '../../data.dart';

part 'users.g.dart';

@Riverpod(keepAlive: true)
Future<List<User>> users(Ref ref) async =>
    ref.read(usersApiProvider).users().unwrap();

@Riverpod(keepAlive: true)
Future<User> user(Ref ref, int id) async =>
    ref.read(usersApiProvider).user(id).unwrap();
