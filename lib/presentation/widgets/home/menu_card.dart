import 'package:cached_network_image/cached_network_image.dart';
import 'package:check_order/core/utils/extension.dart';
import 'package:check_order/data/models/menu/menu_item.dart';
import 'package:check_order/presentation/widgets/common/empty_box.dart';
import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final MenuItemModel item;
  final VoidCallback onTap;

  const MenuCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 200,
        height: 280,
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 21),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x33000000),
              blurRadius: 12,
              offset: Offset(0, 2),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                  width: 176,
                  height: 176,
                  child: item.imageUrl.isNotEmpty
                      ? CachedNetworkImage(imageUrl: item.imageUrl)
                      : Image.asset('assets/images/img_test_menu.png')),
            ),
            const EmptyBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const EmptyBox(height: 8),
                Text(
                  '${item.price.toCommaString()}원',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
