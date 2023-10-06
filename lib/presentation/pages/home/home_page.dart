import 'dart:math';

import 'package:check_order/presentation/widgets/button.dart';
import 'package:check_order/presentation/widgets/empty_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF9FF),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _menu,
          _content,
        ],
      ),
    );
  }

  Widget get _menu {
    return Container(
      width: 280,
      height: 800,
      color: const Color(0xFFF1F1F1),
      padding: const EdgeInsets.only(top: 34, bottom: 24),
      child: Column(
        children: [
          _logo,
          const EmptyBox(height: 39),
          _menuItem(label: '인기메뉴', enabled: true),
          _menuItem(label: '국물요리', enabled: false),
          _menuItem(label: '튀김요리', enabled: false),
          _menuItem(label: '술 & 음료', enabled: false),
          const Spacer(),
          CheckOrderButton(
            label: '주문 내역',
            color: const Color(0xFF2B2B2B),
            onTap: () {},
          ),
          const EmptyBox(height: 12),
          CheckOrderButton(
            label: '직원 호출',
            color: const Color(0xFFFF5D02),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget get _logo {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/icons/icon_logo.svg'),
        const EmptyBox(width: 12),
        const Text(
          'CHECK',
          style: TextStyle(
            color: Color(0xFFFF5D02),
            fontSize: 20,
            fontFamily: 'Aldrich',
            letterSpacing: -0.60,
          ),
        ),
      ],
    );
  }

  Widget _menuItem({required String label, required bool enabled}) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: 264,
        height: 82,
        padding: const EdgeInsets.only(top: 12, right: 16, bottom: 12),
        decoration: ShapeDecoration(
          color: enabled ? Colors.white : null,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
          ),
        ),
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Transform.rotate(
                angle: 45 * pi / 180,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: enabled
                      ? const BoxDecoration(color: Color(0xFFFF5D02))
                      : null,
                ),
              ),
              const EmptyBox(width: 11.69),
              Text(
                label,
                style: TextStyle(
                  color: enabled
                      ? const Color(0xFFFF5D02)
                      : const Color(0xFF2B2B2B),
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _content {
    return Container(width: 1000, height: 800);
  }
}
