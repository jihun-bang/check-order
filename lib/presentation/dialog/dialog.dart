import 'package:flutter/material.dart';

Future<void> showMyDialog({
  required BuildContext context,
  required Widget child,
  double width = 1022,
  double height = 660,
}) async {
  await showDialog(
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
