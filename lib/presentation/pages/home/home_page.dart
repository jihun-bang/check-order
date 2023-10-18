import 'package:check_order/core/theme/app_theme.dart';
import 'package:check_order/data/models/menu/menu_item.dart';
import 'package:check_order/presentation/dialog/dialog.dart';
import 'package:check_order/presentation/pages/cart/add_cart_dialog.dart';
import 'package:check_order/presentation/pages/cart/cart_dialog.dart';
import 'package:check_order/presentation/pages/employee_call/employee_call_dialog.dart';
import 'package:check_order/presentation/pages/order/order_history_dialog.dart';
import 'package:check_order/presentation/providers/cart/cart_provider.dart';
import 'package:check_order/presentation/widgets/common/button.dart';
import 'package:check_order/presentation/widgets/common/empty_box.dart';
import 'package:check_order/presentation/widgets/home/menu_card.dart';
import 'package:check_order/presentation/widgets/home/menu_list_item.dart';
import 'package:check_order/presentation/widgets/home/munu_category_indicator.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../dependencies_injection.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _cartProvider = sl<CartProvider>();

  late final PageController _pageController;
  static const _menuCategories = ['국물요리', '튀김요리', '꼬치구이', '술&음료'];
  int get _page =>
      _pageController.hasClients ? _pageController.page?.toInt() ?? 0 : 0;

  Future<void> _scrollToItem(int index) async {
    _pageController.jumpToPage(index);
    setState(() {});
  }

  void _showAddCart(MenuItemModel item) {
    showMyDialog(
        context: context,
        child: AddCartDialog(
          item: item,
          onAddCart: () {
            _cartProvider.addCartItem(item);
            Navigator.pop(context);
          },
        ));
  }

  void _showCart() {
    showDialog(
        barrierColor: Colors.transparent,
        context: context,
        builder: (_) {
          return const Dialog(
            alignment: Alignment.centerRight,
            insetPadding: EdgeInsets.all(12),
            child: CartDialog(),
          );
        });
  }

  void _showOrderHistory() {
    showMyDialog(context: context, child: const OrderHistoryDialog());
  }

  void _showEmployeeCall() {
    showMyDialog(context: context, child: const EmployeeCallDialog());
  }

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
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
          onPressed: () {
            _showCart();
          },
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
          const EmptyBox(height: 26),
          ..._menuCategories.mapIndexed(
            (index, item) => MenuListItem(
              label: item,
              enabled: _page == index,
              onTap: () async {
                await _scrollToItem(index);
              },
            ),
          ),
          const Spacer(),
          CheckOrderButton(
            label: '주문 내역',
            color: const Color(0xFF2B2B2B),
            onTap: () {
              _showOrderHistory();
            },
          ),
          const EmptyBox(height: 12),
          CheckOrderButton(
            label: '직원 호출',
            color: const Color(0xFFFF5D02),
            onTap: () {
              _showEmployeeCall();
            },
          ),
        ],
      ),
    );
  }

  Widget get _logo {
    return InkWell(
      onTap: () {
        setState(() {
          _pageController.jumpToPage(0);
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 13),
        child: SvgPicture.asset('assets/icons/icon_logo_h.svg'),
      ),
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

  Widget get _menuItems {
    return SizedBox(
      width: 1000,
      child: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        pageSnapping: false,
        itemBuilder: (_, index) {
          return GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(64, 24, 64, 24),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 200 / 280,
              crossAxisCount: 4,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
            ),
            itemCount: 10,
            itemBuilder: (_, menuIndex) {
              final item = MenuItemModel(
                  id: '$index$menuIndex',
                  name: '${_menuCategories[index]} $menuIndex',
                  imageUrl: '',
                  price: 16900);
              return MenuCard(
                item: item,
                onTap: () {
                  _showAddCart(item);
                },
              );
            },
          );
        },
        itemCount: _menuCategories.length,
      ),
    );
  }

  Widget get _menuIndicator {
    return Padding(
      padding: const EdgeInsets.only(top: 62, left: 48),
      child: MenuCategoryIndicator(
        selectedIndex: _page,
        categories: _menuCategories,
        onTap: (index) async {
          await _scrollToItem(index);
        },
      ),
    );
  }
}
