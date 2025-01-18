import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'src/infrastructure.dart';
import 'src/data.dart';
import 'src/presentation.dart';

void main() {
  runApp(
    ProviderScope(
      overrides: [
        usersApiProvider.overrideWith((ref) => ref.read(usersHttpApiProvider)),
      ],
      child: MyApp(),
    ),
  );
}

final _router = GoRouter(
  initialLocation: const UsersRoute().location,
  routes: $appRoutes,
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
