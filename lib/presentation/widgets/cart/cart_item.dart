import 'package:check_order/core/theme/color.dart';
import 'package:check_order/core/utils/extension.dart';
import 'package:check_order/data/models/cart/cart_item.dart';
import 'package:check_order/data/models/menu/menu_item.dart';
import 'package:check_order/presentation/widgets/common/empty_box.dart';
import 'package:check_order/presentation/widgets/common/menu_image.dart';
import 'package:flutter/material.dart';

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
                  imageUrl: item.imageUrl,
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
      icon: const Icon(Icons.close, color: MyColor.gray_30),
    );
  }

  Widget get _buildCounter {
    return Container(
      alignment: Alignment.bottomRight,
      margin: const EdgeInsets.only(right: 17, bottom: 12),
      child: SizedBox(
        width: 170,
        height: 42,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Material(
              color: MyColor.gray_10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: InkWell(
                onTap: () {
                  onRemoveItem.call(cartItem.id);
                },
                borderRadius: BorderRadius.circular(8),
                child: Container(
                    width: 42,
                    padding: const EdgeInsets.all(10),
                    child: const Icon(
                      Icons.remove,
                      color: MyColor.gray_80,
                    )),
              ),
            ),
            Text(
              '${cartItem.count.toCommaString()}개',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Material(
              color: MyColor.gray_10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: InkWell(
                onTap: () {
                  onAddItem.call(cartItem.item);
                },
                borderRadius: BorderRadius.circular(8),
                child: Container(
                    width: 42,
                    padding: const EdgeInsets.all(10),
                    child: const Icon(
                      Icons.add,
                      color: MyColor.gray_80,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _buildLine {
    return const Divider(
      color: MyColor.gray_10,
      thickness: 4,
      height: 4,
    );
  }
}
