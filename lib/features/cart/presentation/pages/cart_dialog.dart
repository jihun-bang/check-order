import 'package:check_order/core/theme/colors.dart';
import 'package:check_order/core/utils/extension.dart';
import 'package:check_order/core/widgets/buttons/app_button.dart';
import 'package:check_order/features/cart/presentation/providers/cart_provider.dart';
import 'package:check_order/features/cart/presentation/widgets/cart_item.dart';
import 'package:check_order/features/dialog/show_logo_message_toast.dart';
import 'package:check_order/features/order/presentation/providers/order_provider.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../dependencies_injection.dart';

class CartDialog extends StatefulWidget {
  const CartDialog({
    super.key,
  });

  @override
  State<CartDialog> createState() => _CartDialogState();
}

class _CartDialogState extends State<CartDialog> {
  final _cartProvider = sl<CartProvider>();
  final _orderProvider = sl<OrderProvider>();

  Future<void> _order() async {
    final success =
        await _orderProvider.addOrder(cartItems: _cartProvider.items);
    if (mounted) {
      final message = success ? '주문이 접수 되었습니다!' : '주문을 실패했습니다.\n직원 호출 부탁드립니다.';
      if (success) {
        Navigator.pop(context);
      }
      showLogoMessageToast(context: context, message: message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 776,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Consumer<CartProvider>(
        builder: (_, __, titleBar) {
          return Column(
            children: [
              titleBar ?? const SizedBox(),
              const Divider(
                color: AppColors.gray10,
                thickness: 4,
                height: 4,
              ),
              Expanded(child: _buildItems),
              _buildOrder,
            ],
          );
        },
        child: _buildTitleBar,
      ),
    );
  }

  Widget get _buildTitleBar {
    return Padding(
      padding: const EdgeInsets.only(left: 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 17, bottom: 14),
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.chevron_left,
                color: AppColors.secondary,
                size: 24,
              ),
            ),
          ),
          const Text(
            '장바구니',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(width: 24),
        ],
      ),
    );
  }

  Widget get _buildItems {
    return ListView.builder(
      itemBuilder: (_, index) {
        return CartItem(
          cartItem: _cartProvider.items[index],
          onDeleteItem: (id) {
            _cartProvider.deleteCartItem(id);
          },
          onAddItem: (item) {
            _cartProvider.addCartItem(item);
          },
          onRemoveItem: (id) {
            _cartProvider.removeCartItem(id);
          },
        );
      },
      itemCount: _cartProvider.items.length,
    );
  }

  Widget get _buildOrder {
    return Container(
      height: 153,
      color: const Color(0xFF2B2B2B),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '합계',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '${_cartProvider.items.map((e) => e.item.price * e.count).sum.toCommaString()}원',
                textAlign: TextAlign.right,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
          AppButton(
            label: '주문하기',
            buttonColor: AppColors.primary,
            width: 332,
            enable: _cartProvider.items.isNotEmpty,
            onTap: () async {
              await _order();
            },
          )
        ],
      ),
    );
  }
}
