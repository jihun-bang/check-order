import 'package:check_order/core/theme/colors.dart';
import 'package:flutter/material.dart';

class EmployeeCallMenuItem extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const EmployeeCallMenuItem({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
          fixedSize: const Size(145, 100),
          alignment: Alignment.center,
          elevation: isSelected ? 4 : 0,
          shape: RoundedRectangleBorder(
            side: isSelected
                ? const BorderSide(width: 1, color: Color(0xFFD5D5D5))
                : const BorderSide(),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(8),
          shadowColor: isSelected ? const Color(0x33000000) : null,
          backgroundColor: isSelected ? AppColors.primary : Colors.white,
          foregroundColor: isSelected ? Colors.white : const Color(0xFF2B2B2B),
          textStyle: TextStyle(
            fontSize: 20,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
          )),
      child: Text(
        label,
        textAlign: TextAlign.center,
      ),
    );
  }
}
