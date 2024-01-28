import 'package:check_order/configs/app_configs.dart';
import 'package:check_order/core/router/route_list.dart';
import 'package:check_order/features/home/presentation/pages/home_page.dart';
import 'package:check_order/features/registration/presentation/pages/table_admin_page.dart';
import 'package:check_order/features/sign_in/presentation/pages/sign_in_page.dart';
import 'package:check_order/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/landing/presentation/pages/landing_page.dart';
import '../../features/registration/presentation/pages/table_password_page.dart';
import '../../features/registration/presentation/pages/table_registration_page.dart';
import '../../services/auth_provider.dart';

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
    initialLocation: RouteList.landing.path,
    debugLogDiagnostics: true,
    routes: routes,
    redirect: (context, state) async {
      final auth = getIt<AuthService>();
      auth.user = ref.read(authProvider.notifier).currentUser;
      final isSigned = (isAuth.value.value ?? false);
      final hasTable = auth.tableInfo.isValid;
      if (isAuth.value.unwrapPrevious().hasError ||
          isAuth.value.isLoading ||
          !isAuth.value.hasValue) {
        return RouteList.landing.path;
      }
      if (state.matchedLocation == RouteList.signIn.path) {
        return isSigned ? RouteList.home.path : null;
      }
      if (state.matchedLocation != RouteList.landing.path) {
        if (isSigned) {
          return hasTable ? null : RouteList.tableRegistration.path;
        } else {
          return RouteList.signIn.path;
        }
      }
      return null;
    },
  );
  ref.onDispose(router.dispose);

  return router;
}

final routes = [
  GoRoute(
    path: RouteList.landing.path,
    name: RouteList.landing.name,
    builder: (context, state) {
      return const LandingPage();
    },
  ),
  GoRoute(
    path: RouteList.signIn.path,
    name: RouteList.signIn.name,
    builder: (context, state) {
      return const SignInPage();
    },
  ),
  GoRoute(
    path: RouteList.tableRegistration.path,
    name: RouteList.tableRegistration.name,
    builder: (context, state) {
      return const TableRegistrationPage();
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
  GoRoute(
    path: RouteList.home.path,
    name: RouteList.home.name,
    builder: (context, state) {
      return const HomePage();
    },
  ),
];
