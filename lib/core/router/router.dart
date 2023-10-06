import 'package:check_order/core/router/route_list.dart';
import 'package:check_order/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../logger.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: RouteList.home.path,
  routes: [
    GoRoute(
      path: RouteList.home.path,
      name: RouteList.home.name,
      builder: (context, state) {
        return const HomePage();
      },
    ),
  ],
  errorBuilder: (context, state) {
    Logger.e(state.error?.message);
    Future.delayed(const Duration(milliseconds: 100)).then((value) {
      router.goNamed(RouteList.home.name);
    });
    return const SizedBox();
  },
);
