import 'package:check_order/core/theme/app_theme.dart';
import 'package:check_order/core/theme/color.dart';
import 'package:check_order/presentation/providers/cart/cart_provider.dart';
import 'package:check_order/presentation/widgets/cart/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../dependencies_injection.dart';

class CartDialog extends StatefulWidget {
  const CartDialog({
    super.key,
  });

  @override
  State<CartDialog> createState() => _CartDialogState();
}

class _CartDialogState extends State<CartDialog> {
  final _provider = sl<CartProvider>();

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
      child: Column(
        children: [
          _buildTitleBar,
          const Divider(
            color: MyColor.gray_10,
            thickness: 4,
            height: 4,
          ),
          Expanded(child: _buildItems),
        ],
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
                color: kPrimaryColor,
                size: 24,
              ),
            ),
          ),
          const Text(
            '장바구니',
            style: TextStyle(
              color: kPrimaryColor,
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
    return Consumer<CartProvider>(builder: (_, __, ___) {
      return ListView.builder(
        itemBuilder: (_, index) {
          return CartItem(
            cartItem: _provider.items[index],
            onDeleteItem: (id) {
              _provider.deleteCartItem(id);
            },
            onAddItem: (item) {
              _provider.addCartItem(item);
            },
            onRemoveItem: (id) {
              _provider.removeCartItem(id);
            },
          );
        },
        itemCount: _provider.items.length,
      );
    });
  }
}
