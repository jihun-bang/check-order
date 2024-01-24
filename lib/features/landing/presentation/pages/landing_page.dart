import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/route_list.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/buttons/app_button.dart';

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 100, top: 226),
            margin: const EdgeInsets.only(right: 24),
            width: 620,
            color: const Color(0xFFF1F1F1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: SvgPicture.asset('assets/icons/icon_logo_h.svg'),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Text(
                        '테이블',
                        style: TextStyle(
                          color: Color(0xFF5F5F5F),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 31, bottom: 88),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '체크\n',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: '테이블 오더',
                          style: TextStyle(
                            color: AppColors.secondary,
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                AppButton(
                  label: '시작하기',
                  width: 433,
                  buttonColor: AppColors.secondary,
                  onTap: () {
                    context.goNamed(RouteList.signIn.name);
                  },
                )
              ],
            ),
          ),
          Image.asset('assets/images/img_landing.png', width: 558, height: 319)
        ],
      ),
    );
  }
}
