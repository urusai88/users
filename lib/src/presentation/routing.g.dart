// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routing.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $userDetailsRoute,
      $usersRoute,
    ];

RouteBase get $userDetailsRoute => GoRouteData.$route(
      path: '/users/:id',
      factory: $UserDetailsRouteExtension._fromState,
    );

extension $UserDetailsRouteExtension on UserDetailsRoute {
  static UserDetailsRoute _fromState(GoRouterState state) => UserDetailsRoute(
        id: int.parse(state.pathParameters['id']!),
      );

  String get location => GoRouteData.$location(
        '/users/${Uri.encodeComponent(id.toString())}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $usersRoute => GoRouteData.$route(
      path: '/users',
      factory: $UsersRouteExtension._fromState,
    );

extension $UsersRouteExtension on UsersRoute {
  static UsersRoute _fromState(GoRouterState state) => const UsersRoute();

  String get location => GoRouteData.$location(
        '/users',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
