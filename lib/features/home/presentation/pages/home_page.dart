import 'package:check_order/core/router/route_list.dart';
import 'package:check_order/core/theme/colors.dart';
import 'package:check_order/features/cart/presentation/pages/cart_dialog.dart';
import 'package:check_order/features/cart/presentation/providers/cart_provider.dart';
import 'package:check_order/features/dialog/dialog.dart';
import 'package:check_order/features/employee_call/presentation/pages/employee_call_dialog.dart';
import 'package:check_order/features/employee_call/presentation/providers/employee_call_provider.dart';
import 'package:check_order/features/home/data/models/menu_item.dart';
import 'package:check_order/features/home/presentation/providers/menu_provider.dart';
import 'package:check_order/features/home/presentation/widgets/category_list_item.dart';
import 'package:check_order/services/auth_service.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/buttons/app_button.dart';
import '../../../../core/widgets/empty_box.dart';
import '../../../../dependencies_injection.dart';
import '../../../cart/presentation/pages/add_cart_dialog.dart';
import '../../../order/presentation/pages/order_history_dialog.dart';
import '../widgets/category_indicator.dart';
import '../widgets/menu_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _cartProvider = sl<CartProvider>();
  final _menuProvider = sl<MenuProvider>();
  final _employeeCallProvider = sl<EmployeeCallProvider>();
  late final PageController _pageController;

  List<String> get _menuCategories => _menuProvider.categories;

  List<MenuItemModel> get _items => _menuProvider.items;

  int get _page =>
      _pageController.hasClients ? _pageController.page?.toInt() ?? 0 : 0;
  int _logoClickCounter = 0;

  Future<void> _scrollToItem(int index) async {
    _pageController.jumpToPage(index);
    setState(() {});
  }

  Future<void> _showAddCart(MenuItemModel item) async {
    await showMyDialog(
        context: context,
        child: AddCartDialog(
          item: item,
          onAddCart: () {
            _cartProvider.addCartItem(item);
            Navigator.pop(context);
            _showCart();
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
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: CartDialog(),
          );
        });
  }

  void _showOrderHistory() {
    showMyDialog(context: context, child: const OrderHistoryDialog());
  }

  Future<void> _showEmployeeCall() async {
    await showMyDialog(context: context, child: const EmployeeCallDialog());
    _employeeCallProvider.clear();
  }

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Consumer<MenuProvider>(builder: (_, __, ___) {
          if (_menuCategories.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _menu,
              Expanded(child: _content),
            ],
          );
        }),
        floatingActionButton: _cart);
  }

  Widget get _cart {
    return SizedBox(
      width: 92,
      height: 92,
      child: FittedBox(
        child: FloatingActionButton(
          backgroundColor: AppColors.primary,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Consumer<CartProvider>(builder: (_, provider, ___) {
              return SvgPicture.asset(
                'assets/icons/icon_cart${provider.items.isNotEmpty ? '_badge' : ''}.svg',
                width: 52,
                height: 52,
              );
            }),
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
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                  children: _menuCategories
                      .mapIndexed(
                        (index, item) => CategoryListItem(
                          label: item,
                          enabled: _page == index,
                          onTap: () async {
                            await _scrollToItem(index);
                          },
                        ),
                      )
                      .toList()),
            ),
          ),
          AppButton(
            label: '주문 내역',
            buttonColor: const Color(0xFF2B2B2B),
            onTap: () {
              _showOrderHistory();
            },
          ),
          const EmptyBox(height: 12),
          AppButton(
            label: '직원 호출',
            buttonColor: const Color(0xFFFF5D02),
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
        _logoClickCounter++;
        if (_logoClickCounter == 5) {
          _logoClickCounter = 0;
          context.goNamed(RouteList.tablePassword.name);
        } else {
          setState(() {
            _pageController.jumpToPage(0);
          });
        }
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
        _categoryIndicator,
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
        itemBuilder: (_, categoryIndex) {
          final items = _items
              .where((item) => item.category == _menuCategories[categoryIndex]);
          return GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(64, 24, 64, 24),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 200 / 280,
              crossAxisCount: 4,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
            ),
            itemCount: items.length,
            itemBuilder: (_, menuIndex) {
              final item = items.elementAt(menuIndex);
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

  Widget get _categoryIndicator {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 108,
          height: 53,
          alignment: Alignment.center,
          decoration: ShapeDecoration(
            color: const Color(0xFFF1F1F1),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: Consumer<AuthService>(builder: (_, auth, ___) {
            return Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '${auth.tableInfo.tableName}\n',
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const TextSpan(
                    text: '테이블 번호',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            );
          }),
        ),
        Container(
          margin: const EdgeInsets.only(right: 48),
          child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 8, left: 48),
              scrollDirection: Axis.horizontal,
              child: CategoryIndicator(
                selectedIndex: _page,
                categories: _menuCategories,
                onTap: (index) async {
                  await _scrollToItem(index);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
