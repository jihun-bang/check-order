import 'package:check_order/core/theme/color.dart';
import 'package:check_order/presentation/widgets/common/empty_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmployeeCallDialog extends StatefulWidget {
  const EmployeeCallDialog({
    super.key,
  });

  @override
  State<EmployeeCallDialog> createState() => _EmployeeCallDialogState();
}

class _EmployeeCallDialogState extends State<EmployeeCallDialog> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 36, right: 36),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 36, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTitleBar,
                _buildClose,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget get _buildClose {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      constraints: const BoxConstraints(),
      iconSize: 36,
      icon: const Icon(Icons.close, color: MyColor.gray_30),
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
        const Text(
          '직원 호출',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
