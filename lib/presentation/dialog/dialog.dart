import 'package:flutter/material.dart';

void showMyDialog({required BuildContext context, required Widget child}) {
  showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          child: Container(
            width: 1022,
            height: 660,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: child,
          ),
        );
      });
}
