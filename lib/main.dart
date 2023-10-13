import 'dart:ui';

import 'package:check_order/presentation/providers/cart/cart_provider.dart';
import 'package:check_order/presentation/providers/order/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'core/router/router.dart';
import 'core/theme/app_theme.dart';
import 'dependencies_injection.dart';

void main() {
  setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints.tight(const Size(1280, 800)),
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider<CartProvider>(create: (_) => sl()),
            ChangeNotifierProvider<OrderProvider>(create: (_) => sl()),
          ],
          child: MaterialApp.router(
            title: 'Check',
            theme: appTheme,
            routeInformationProvider: router.routeInformationProvider,
            routeInformationParser: router.routeInformationParser,
            routerDelegate: router.routerDelegate,
            debugShowCheckedModeBanner: false,
            scrollBehavior: const ScrollBehavior()
                .copyWith(dragDevices: PointerDeviceKind.values.toSet()),
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('ko', 'KR'),
            ],
          ),
        ),
      ),
    );
  }
}
