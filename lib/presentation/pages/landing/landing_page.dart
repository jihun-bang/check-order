import 'package:check_order/core/theme/app_theme.dart';
import 'package:check_order/presentation/widgets/common/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/route_list.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 100, top: 226),
            width: 620,
            color: const Color(0xFFF1F1F1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset('assets/icons/icon_logo_h.svg'),
                const Padding(
                  padding: EdgeInsets.only(top: 31, bottom: 88),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Menu to Meal\n',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: 'Table Order',
                          style: TextStyle(
                            color: kSecondaryColor,
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                CheckOrderButton(
                  label: '시작하기',
                  width: 433,
                  color: kSecondaryColor,
                  onTap: () {
                    context.goNamed(RouteList.tableRegistration.name);
                  },
                )
              ],
            ),
          ),
          Container()
        ],
      ),
    );
  }
}
