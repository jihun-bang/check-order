import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showMessageToast({
  required BuildContext context,
  required String message,
}) {
  final toast = FToast();
  toast.init(context);
  toast.removeCustomToast();
  toast.removeQueuedCustomToasts();
  toast.showToast(
      child: Container(
        width: 353,
        height: 51,
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          color: const Color(0xFFF1F1F1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFF5F5F5F),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      positionedToastBuilder: (context, child) {
        return Positioned(
          top: 27,
          left: 488,
          child: child,
        );
      },
      gravity: ToastGravity.CENTER,
      toastDuration: const Duration(milliseconds: 1500));
}
