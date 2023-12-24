import 'package:check_order/core/theme/colors.dart';
import 'package:check_order/core/utils/extension.dart';
import 'package:check_order/core/widgets/counter.dart';
import 'package:check_order/core/widgets/menu_image.dart';
import 'package:check_order/features/cart/data/models/cart_item.dart';
import 'package:check_order/features/home/data/models/menu_item.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/empty_box.dart';

class CartItem extends StatelessWidget {
  final CartItemModel cartItem;
  final Function(String) onDeleteItem;
  final Function(MenuItemModel) onAddItem;
  final Function(String) onRemoveItem;

  const CartItem({
    super.key,
    required this.cartItem,
    required this.onDeleteItem,
    required this.onAddItem,
    required this.onRemoveItem,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 380,
      height: 192,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: _buildMenuInfo),
          _buildCounter,
          _buildLine,
        ],
      ),
    );
  }

  Widget get _buildMenuInfo {
    final item = cartItem.item;

    return Padding(
      padding: const EdgeInsets.only(left: 24, top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.name,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              _buildClose,
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12, right: 12),
                child: MenuImage(
                  imageUrl:
                      'assets/images/menu/60/image ${int.parse(item.id) + 1}.png',
                  width: 60,
                  height: 60,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '가격 : ${item.price.toCommaString()}원',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const EmptyBox(height: 4),
                  Text(
                    '${(item.price * cartItem.count).toCommaString()}원',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget get _buildClose {
    return IconButton(
      onPressed: () {
        onDeleteItem.call(cartItem.id);
      },
      constraints: const BoxConstraints(),
      iconSize: 24,
      icon: const Icon(Icons.close, color: AppColors.gray30),
    );
  }

  Widget get _buildCounter {
    return Container(
      alignment: Alignment.bottomRight,
      margin: const EdgeInsets.only(right: 17, bottom: 12),
      child: Counter(
        value: cartItem.count,
        onPlus: () {
          onAddItem.call(cartItem.item);
        },
        onMinus: () {
          onRemoveItem.call(cartItem.id);
        },
      ),
    );
  }

  Widget get _buildLine {
    return const Divider(
      color: AppColors.gray10,
      thickness: 4,
      height: 4,
    );
  }
}
