import 'dart:ui';

import 'package:check_order/data/service/auth_service.dart';
import 'package:check_order/features/cart/presentation/providers/cart_provider.dart';
import 'package:check_order/features/employee_call/presentation/providers/employee_call_provider.dart';
import 'package:check_order/features/home/presentation/providers/menu_provider.dart';
import 'package:check_order/features/order/presentation/providers/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

import 'core/router/router.dart';
import 'core/theme/app_theme.dart';
import 'dependencies_injection.dart';

const storage = FlutterSecureStorage();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints.tight(const Size(1280, 800)),
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider<AuthService>(create: (_) => sl()),
            ChangeNotifierProvider<CartProvider>(create: (_) => sl()),
            ChangeNotifierProvider<OrderProvider>(create: (_) => sl()),
            ChangeNotifierProvider<EmployeeCallProvider>(create: (_) => sl()),
            ChangeNotifierProvider<MenuProvider>(create: (_) => sl()),
          ],
          child: MaterialApp.router(
            title: 'Check',
            theme: kAppTheme,
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
