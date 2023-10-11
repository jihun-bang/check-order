import 'package:check_order/core/theme/app_theme.dart';
import 'package:check_order/presentation/widgets/button.dart';
import 'package:check_order/presentation/widgets/empty_box.dart';
import 'package:check_order/presentation/widgets/home/menu_card.dart';
import 'package:check_order/presentation/widgets/home/menu_list_item.dart';
import 'package:check_order/presentation/widgets/home/munu_category_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final _scrollController = ScrollController();
  static const _menuCategories = ['국물요리', '튀김요리', '꼬치구이', '술&음료'];

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
        floatingActionButton: _cart);
  }

  Widget get _cart {
    return SizedBox(
      width: 92,
      height: 92,
      child: FittedBox(
        child: FloatingActionButton(
          backgroundColor: kPrimaryColor,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(
              'assets/icons/icon_cart.svg',
            ),
          ),
          onPressed: () {},
        ),
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
          const MenuListItem(label: '인기메뉴', enabled: true),
          const MenuListItem(label: '국물요리', enabled: false),
          const MenuListItem(label: '튀김요리', enabled: false),
          const MenuListItem(label: '술 & 음료', enabled: false),
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

  Widget get _content {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _menuIndicator,
        Expanded(child: _menuItems),
      ],
    );
  }

  Widget get _menuIndicator {
    return Padding(
      padding: const EdgeInsets.only(top: 62, left: 48),
      child: MenuCategoryIndicator(
        controller: TabController(length: 4, vsync: this),
        categories: _menuCategories,
      ),
    );
  }

  Widget get _menuItems {
    return SizedBox(
      width: 1000,
      child: GridView.builder(
          padding: const EdgeInsets.fromLTRB(64, 24, 64, 24),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 200 / 280,
            crossAxisCount: 4,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
          ),
          itemCount: 24,
          itemBuilder: (BuildContext context, int index) {
            return const MenuCard(
              name: '금게조개술찜',
              price: 16900,
            );
          }),
    );
  }
}
