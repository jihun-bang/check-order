import 'dart:ui';

import 'package:check_order/features/cart/presentation/providers/cart_provider.dart';
import 'package:check_order/features/employee_call/presentation/providers/employee_call_provider.dart';
import 'package:check_order/features/home/presentation/providers/menu_provider.dart';
import 'package:check_order/features/order/presentation/providers/order_provider.dart';
import 'package:check_order/services/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart' as p;
import 'package:url_strategy/url_strategy.dart';

import 'configs/app_configs.dart';
import 'core/router/router.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/state_logger.dart';
import 'dependencies_injection.dart';
import 'firebase_options.dart';

const storage = FlutterSecureStorage();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  setPathUrlStrategy();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await configureDependencies();
  runApp(
    const ProviderScope(
      observers: [StateLogger()],
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider);

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints.tight(const Size(1280, 800)),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: p.MultiProvider(
            providers: [
              p.ChangeNotifierProvider<AuthService>(create: (_) => sl()),
              p.ChangeNotifierProvider<CartProvider>(create: (_) => sl()),
              p.ChangeNotifierProvider<OrderProvider>(create: (_) => sl()),
              p.ChangeNotifierProvider<EmployeeCallProvider>(
                  create: (_) => sl()),
              p.ChangeNotifierProvider<MenuProvider>(create: (_) => sl()),
            ],
            child: MaterialApp.router(
              routerConfig: router,
              theme: kAppTheme,
              title: '체크오더',
              debugShowCheckedModeBanner: false,
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              scrollBehavior: const ScrollBehavior()
                  .copyWith(dragDevices: PointerDeviceKind.values.toSet()),
            ),
          ),
        ),
      ),
    );
  }
}
