import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../presentation.dart';

part 'routing.g.dart';

@TypedGoRoute<UserDetailsRoute>(path: '/users/:id')
class UserDetailsRoute extends GoRouteData {
  const UserDetailsRoute({
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      UserDetailsScreen(id: id);
}

@TypedGoRoute<UsersRoute>(path: '/users')
class UsersRoute extends GoRouteData {
  const UsersRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const UsersScreen();
}
