import 'package:flutter/material.dart';

import 'colors.dart';

final kAppTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  fontFamily: 'Pretendard',
  primaryColor: AppColors.primary,
  appBarTheme: const AppBarTheme(
    toolbarHeight: 44,
    elevation: 0,
    backgroundColor: Colors.white,
    scrolledUnderElevation: 0,
  ),
);
