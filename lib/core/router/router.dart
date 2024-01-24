import 'package:check_order/core/router/route_list.dart';
import 'package:check_order/features/home/presentation/pages/home_page.dart';
import 'package:check_order/features/registration/presentation/pages/table_admin_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/landing/presentation/pages/landing_page.dart';
import '../../features/registration/presentation/pages/table_password_page.dart';
import '../../features/registration/presentation/pages/table_registration_page.dart';
import '../../services/auth_provider.dart';
import '../utils/logger.dart';

part 'router.g.dart';

final routerKey = GlobalKey<NavigatorState>(debugLabel: 'routerKey');

@riverpod
GoRouter router(RouterRef ref) {
  final isAuth = ValueNotifier<AsyncValue<bool>>(const AsyncLoading());
  ref
    ..onDispose(isAuth.dispose)
    ..listen(
      authProvider.select((value) => value.whenData((value) => value.isAuth)),
      (_, next) {
        isAuth.value = next;
      },
    );

  final router = GoRouter(
    navigatorKey: routerKey,
    refreshListenable: isAuth,
    initialLocation: RouteList.home.path,
    debugLogDiagnostics: true,
    routes: routes,
    redirect: (context, state) async {
      final isSigned = (isAuth.value.value ?? false);
      if (isAuth.value.unwrapPrevious().hasError ||
          isAuth.value.isLoading ||
          !isAuth.value.hasValue) {
        Logger.e(
            '인증 중...[isLoading=${isAuth.value.isLoading}, hasError=${isAuth.value.unwrapPrevious().hasError} hasValue=${isAuth.value.hasValue}]');
        return RouteList.landing.path;
      }

      if (state.matchedLocation == RouteList.signIn.path) {
        return isSigned ? '/${RouteList.landing.path}' : null;
      }
      if (!isSigned) {
        return '/${RouteList.signIn.path}';
      }
      return null;
    },
  );
  ref.onDispose(router.dispose);

  return router;
}

final routes = [
  GoRoute(
    path: RouteList.tableRegistration.path,
    name: RouteList.tableRegistration.name,
    builder: (context, state) {
      return const TableRegistrationPage();
    },
  ),
  GoRoute(
      path: RouteList.home.path,
      name: RouteList.home.name,
      builder: (context, state) {
        return const HomePage();
      },
      routes: [
        GoRoute(
          path: RouteList.landing.path,
          name: RouteList.landing.name,
          builder: (context, state) {
            return const LandingPage();
          },
        ),
        GoRoute(
          path: RouteList.tablePassword.path,
          name: RouteList.tablePassword.name,
          builder: (context, state) {
            return const TablePasswordPage();
          },
        ),
        GoRoute(
          path: RouteList.admin.path,
          name: RouteList.admin.name,
          builder: (context, state) {
            return const TableAdminPage();
          },
        ),
      ]),
];
