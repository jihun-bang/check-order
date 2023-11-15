import 'package:check_order/presentation/widgets/common/empty_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theme/color.dart';

class DialogTitle extends StatelessWidget {
  final String title;

  const DialogTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTitleBar,
        _buildClose(context),
      ],
    );
  }

  Widget get _buildTitleBar {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/icon_logo.svg',
          width: 26.67,
          height: 21.33,
        ),
        const EmptyBox(width: 6.67),
        Text(
          title,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _buildClose(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      constraints: const BoxConstraints(),
      iconSize: 36,
      icon: const Icon(Icons.close, color: MyColor.gray_30),
    );
  }
}
