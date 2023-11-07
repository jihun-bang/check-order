import 'dart:math';

import 'package:flutter/material.dart';

import '../common/empty_box.dart';

class CategoryListItem extends StatelessWidget {
  final String label;
  final bool enabled;
  final VoidCallback onTap;

  const CategoryListItem({
    super.key,
    required this.label,
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          width: 264,
          height: 82,
          padding: const EdgeInsets.only(top: 12, right: 16, bottom: 12),
          decoration: ShapeDecoration(
            color: enabled ? Colors.white : null,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
          ),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Transform.rotate(
                  angle: 45 * pi / 180,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: enabled
                        ? const BoxDecoration(color: Color(0xFFFF5D02))
                        : null,
                  ),
                ),
                const EmptyBox(width: 11.69),
                Text(
                  label,
                  style: TextStyle(
                    color: enabled
                        ? const Color(0xFFFF5D02)
                        : const Color(0xFF2B2B2B),
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
