import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tio/tio.dart';

import 'src/data.dart';
import 'src/presentation.dart';
import 'src/services.dart';

final _dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));
final _factoryConfig = TioFactoryConfig<void>(
  jsonFactories: {
    User.fromJson,
  },
  errorStringFactory: (string) {},
  errorJsonFactory: (json) {},
);
final _tio = Tio(dio: _dio, factoryConfig: _factoryConfig);

void main() {
  runApp(
    ProviderScope(
      overrides: [
        tioProvider.overrideWith((ref) => _tio),
      ],
      child: MyApp(),
    ),
  );
}

final _router = GoRouter(
  initialLocation: const UsersRoute().location,
  routes: [
    $usersRoute,
    $userDetailsRoute,
  ],
);

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Users Demo',
      theme: ThemeData(
        brightness: ref.watch(brightnessProvider),
      ),
      routerConfig: _router,
    );
  }
}
