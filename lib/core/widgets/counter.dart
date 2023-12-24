import 'package:check_order/core/utils/extension.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';

class Counter extends StatelessWidget {
  final int value;
  final VoidCallback onPlus;
  final VoidCallback onMinus;

  const Counter({
    super.key,
    required this.value,
    required this.onPlus,
    required this.onMinus,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      height: 42,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Material(
            color: AppColors.gray10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: InkWell(
              onTap: onMinus,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                  width: 42,
                  padding: const EdgeInsets.all(10),
                  child: const Icon(
                    Icons.remove,
                    color: AppColors.gray80,
                  )),
            ),
          ),
          Text(
            '${value.toCommaString()}개',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Material(
            color: AppColors.gray10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: InkWell(
              onTap: onPlus,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                  width: 42,
                  padding: const EdgeInsets.all(10),
                  child: const Icon(
                    Icons.add,
                    color: AppColors.gray80,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
