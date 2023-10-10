import 'package:check_order/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class MenuListIndicator extends StatelessWidget {
  final TabController controller;
  final List<String> menuItems;

  const MenuListIndicator({
    super.key,
    required this.controller,
    required this.menuItems,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      alignment: Alignment.bottomCenter,
      children: [
        const Positioned.fill(
          bottom: 1,
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color(0xFFD4D4D4), width: 2.0),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 392,
          height: 33,
          child: TabBar(
            controller: controller,
            indicatorColor: kPrimaryColor,
            indicatorWeight: 4,
            tabs: [
              ...menuItems.map((e) => _tab(e)),
            ],
          ),
        ),
      ],
    );
  }

  Tab _tab(String menu) {
    final isSelected = controller.index == menuItems.indexOf(menu);
    return Tab(
      height: 33,
      child: Text(
        menu,
        style: TextStyle(
          color: isSelected ? const Color(0xFFFF5D02) : const Color(0xFF2B2B2B),
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
