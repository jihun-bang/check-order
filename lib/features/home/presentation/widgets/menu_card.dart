import 'package:check_order/core/utils/extension.dart';
import 'package:check_order/data/models/menu/menu_item.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/empty_box.dart';

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
              child: Stack(
                children: [
                  Container(
                      width: 176,
                      height: 176,
                      color: AppColors.gray20,
                      child: item.imageUrl176.isNotEmpty

                          /// TODO Cached 처리
                          ? Image.asset(
                              item.imageUrl176,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              'assets/images/menu/176/image ${int.parse(item.id) + 1}.png',
                              fit: BoxFit.cover,
                            )),
                  if (item.isSoldOut)
                    Opacity(
                      opacity: 0.60,
                      child: Container(
                        width: 176,
                        height: 176,
                        decoration:
                            const BoxDecoration(color: Color(0xFF0D0D0D)),
                      ),
                    ),
                  if (item.isSoldOut)
                    const Positioned.fill(
                      child: Center(
                        child: Text(
                          '품절',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const EmptyBox(height: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      item.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
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
            ),
          ],
        ),
      ),
    );
  }
}
