import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';

class PageInfoLabel extends StatelessWidget {
  final String label;

  const PageInfoLabel({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 153,
      height: 36,
      alignment: Alignment.center,
      decoration: ShapeDecoration(
        color: AppColors.gray10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xFF5F5F5F),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
