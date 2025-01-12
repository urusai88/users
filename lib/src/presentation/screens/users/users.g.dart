// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $usersRoute,
    ];

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

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userNameOrderingHash() => r'28a08b215fcaa33b3d6431af1f4a3a054956a549';

/// See also [UserNameOrdering].
@ProviderFor(UserNameOrdering)
final userNameOrderingProvider =
    NotifierProvider<UserNameOrdering, UserNameOrder>.internal(
  UserNameOrdering.new,
  name: r'userNameOrderingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userNameOrderingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserNameOrdering = Notifier<UserNameOrder>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
