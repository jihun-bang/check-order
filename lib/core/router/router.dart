import 'package:check_order/core/router/route_list.dart';
import 'package:check_order/features/home/presentation/pages/home_page.dart';
import 'package:check_order/features/registration/presentation/pages/table_admin_page.dart';
import 'package:check_order/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../dependencies_injection.dart';
import '../../features/landing/presentation/pages/landing_page.dart';
import '../../features/registration/presentation/pages/table_password_page.dart';
import '../../features/registration/presentation/pages/table_registration_page.dart';
import '../utils/logger.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: RouteList.home.path,
  routes: [
    GoRoute(
        path: RouteList.tableRegistration.path,
        name: RouteList.tableRegistration.name,
        builder: (context, state) {
          return const TableRegistrationPage();
        },
        redirect: (_, __) async {
          return await _isLogin() ? '/${RouteList.home.path}' : null;
        }),
    GoRoute(
        path: RouteList.home.path,
        name: RouteList.home.name,
        builder: (context, state) {
          return const HomePage();
        },
        redirect: (_, __) async {
          return await _isLogin() ? null : '/${RouteList.landing.path}';
        },
        routes: [
          GoRoute(
            path: RouteList.landing.path,
            name: RouteList.landing.name,
            builder: (context, state) {
              return const LandingPage();
            },
            redirect: (_, state) async {
              return await _isLogin() ? '/${RouteList.home.path}' : null;
            },
          ),
          GoRoute(
              path: RouteList.tablePassword.path,
              name: RouteList.tablePassword.name,
              builder: (context, state) {
                return const TablePasswordPage();
              },
              redirect: (_, __) async {
                return await _isLogin() ? null : '/${RouteList.landing.path}';
              }),
          GoRoute(
              path: RouteList.admin.path,
              name: RouteList.admin.name,
              builder: (context, state) {
                return const TableAdminPage();
              },
              redirect: (_, __) async {
                return await _isLogin() ? null : '/${RouteList.landing.path}';
              }),
        ]),
  ],
  errorBuilder: (context, state) {
    Logger.e(state.error?.message);
    Future.delayed(const Duration(milliseconds: 100)).then((value) {
      router.goNamed(RouteList.landing.name);
    });
    return const SizedBox();
  },
);

Future<bool> _isLogin() async {
  final auth = sl<AuthService>();
  await auth.getTable();
  final isLogin = auth.tableInfo.isValid;
  Logger.d(auth.tableInfo.toJson());
  return isLogin;
}
