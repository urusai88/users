import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:users/main.dart';

import '../../../domain.dart';
import '../../../presentation.dart';

part 'users.g.dart';

enum _UserNameOrdering { asc, desc, none }

@TypedGoRoute<UsersRoute>(path: '/users')
class UsersRoute extends GoRouteData {
  const UsersRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const UsersScreen();
}

class UsersScreen extends ConsumerStatefulWidget {
  const UsersScreen({super.key});

  @override
  ConsumerState<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends ConsumerState<UsersScreen> {
  var _ordering = _UserNameOrdering.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                switch (_ordering) {
                  case _UserNameOrdering.asc:
                    _ordering = _UserNameOrdering.desc;
                  case _UserNameOrdering.desc:
                    _ordering = _UserNameOrdering.none;
                  case _UserNameOrdering.none:
                    _ordering = _UserNameOrdering.asc;
                }
              });
            },
            icon: Icon(
              Icons.sort_by_alpha,
              color: switch (_ordering) {
                _UserNameOrdering.asc => Colors.green,
                _UserNameOrdering.desc => Colors.red,
                _UserNameOrdering.none => null,
              },
            ),
          ),
          IconButton(
            onPressed: () => MyApp.of(context).toggleBrightness(),
            icon: Icon(Icons.brightness_2),
          ),
        ],
      ),
      body: ref.watch(usersProvider).when(
            data: (users) {
              users = switch (_ordering) {
                _UserNameOrdering.asc => users.sorted(
                    (a, b) =>
                        a.name.toLowerCase().compareTo(b.name.toLowerCase()),
                  ),
                _UserNameOrdering.desc => users.sorted(
                    (a, b) =>
                        b.name.toLowerCase().compareTo(a.name.toLowerCase()),
                  ),
                _UserNameOrdering.none => users,
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
