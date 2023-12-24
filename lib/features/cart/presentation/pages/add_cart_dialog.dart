import 'package:cached_network_image/cached_network_image.dart';
import 'package:check_order/core/theme/colors.dart';
import 'package:check_order/core/utils/extension.dart';
import 'package:check_order/core/widgets/buttons/app_button.dart';
import 'package:check_order/features/dialog/show_message_toast.dart';
import 'package:check_order/features/home/data/models/menu_item.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/empty_box.dart';

class AddCartDialog extends StatefulWidget {
  final MenuItemModel item;
  final VoidCallback onAddCart;

  const AddCartDialog({
    super.key,
    required this.item,
    required this.onAddCart,
  });

  @override
  State<AddCartDialog> createState() => _AddCartDialogState();
}

class _AddCartDialogState extends State<AddCartDialog> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildImage,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildMenuInfo),
              _buildAddCart,
            ],
          ),
        ),
      ],
    );
  }

  Widget get _buildImage {
    final imageUrl = widget.item.imageUrl600;

    return Padding(
      padding: const EdgeInsets.all(30),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
            width: 600,
            height: 600,
            child: imageUrl.isNotEmpty
                ? CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    'assets/images/menu/600/image ${int.parse(widget.item.id) + 1}.png',
                    fit: BoxFit.cover,
                  )),
      ),
    );
  }

  Widget get _buildMenuInfo {
    return Padding(
      padding: const EdgeInsets.only(top: 45, right: 30, bottom: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.item.name,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '${widget.item.price.toCommaString()}원',
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          const EmptyBox(height: 20),
          const Expanded(
            child: Text(
              '참기름을 곁들인 신선한 육회에 바삭한 콘을 얹은 우주 최강 안주',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget get _buildAddCart {
    return Container(
      margin: const EdgeInsets.only(bottom: 30, right: 30),
      alignment: Alignment.center,
      child: AppButton(
        width: 332,
        label: '장바구니 담기',
        buttonColor: AppColors.secondary,
        onTap: !widget.item.isSoldOut
            ? widget.onAddCart
            : () {
                showMessageToast(context: context, message: '해당 상품은 품절되었습니다.');
              },
      ),
    );
  }
}
