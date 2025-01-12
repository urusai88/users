import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain.dart';
import '../../../presentation.dart';

part 'users.g.dart';

enum UserNameOrder { asc, desc, none }

@Riverpod(keepAlive: true)
class UserNameOrdering extends _$UserNameOrdering {
  @override
  UserNameOrder build() => UserNameOrder.none;

  void next() {
    state = switch (state) {
      UserNameOrder.asc => UserNameOrder.desc,
      UserNameOrder.desc => UserNameOrder.none,
      UserNameOrder.none => UserNameOrder.asc,
    };
  }
}

@TypedGoRoute<UsersRoute>(path: '/users')
class UsersRoute extends GoRouteData {
  const UsersRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const UsersScreen();
}

class UsersScreen extends ConsumerWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => ref.read(userNameOrderingProvider.notifier).next(),
            icon: Icon(
              Icons.sort_by_alpha,
              color: switch (ref.watch(userNameOrderingProvider)) {
                UserNameOrder.asc => Colors.green,
                UserNameOrder.desc => Colors.red,
                UserNameOrder.none => null,
              },
            ),
          ),
          IconButton(
            onPressed: () => ref.read(brightnessProvider.notifier).toggle(),
            icon: Icon(Icons.brightness_2),
          ),
        ],
      ),
      body: ref.watch(usersProvider).when(
            data: (users) {
              int compareStrings(String a, String b) =>
                  a.toLowerCase().compareTo(b.toLowerCase());

              users = switch (ref.watch(userNameOrderingProvider)) {
                UserNameOrder.asc =>
                  users.sorted((a, b) => compareStrings(a.name, b.name)),
                UserNameOrder.desc =>
                  users.sorted((a, b) => compareStrings(b.name, a.name)),
                UserNameOrder.none => users,
              };

              return RefreshIndicator(
                onRefresh: () async => ref.refresh(usersProvider.future),
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return ListTile(
                      onTap: () => UserDetailsRoute(id: user.id).push(context),
                      leading: Text('#${user.id}'),
                      title: Text(user.name),
                      trailing: Icon(Icons.chevron_right),
                    );
                  },
                ),
              );
            },
            error: (error, stackTrace) => RefreshIndicator(
              onRefresh: () async => ref.refresh(usersProvider.future),
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    child: Center(
                      child: Text('Error: $error'),
                    ),
                  )
                ],
              ),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
    );
  }
}
