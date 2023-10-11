import 'package:cached_network_image/cached_network_image.dart';
import 'package:check_order/core/utils/extension.dart';
import 'package:check_order/presentation/widgets/empty_box.dart';
import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final String name;
  final int price;
  final String? imageUrl;

  const MenuCard({
    super.key,
    required this.name,
    required this.price,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                child: imageUrl != null
                    ? CachedNetworkImage(imageUrl: imageUrl!)
                    : Image.asset('assets/images/img_test_menu.png')),
          ),
          const EmptyBox(height: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const EmptyBox(height: 8),
              Text(
                '${price.toCommaString()}원',
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
    );
  }
}
