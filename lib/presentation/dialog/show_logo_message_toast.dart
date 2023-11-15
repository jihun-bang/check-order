import 'package:check_order/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../widgets/common/empty_box.dart';

void showLogoMessageToast({
  required BuildContext context,
  required String message,
}) {
  final toast = FToast();
  toast.init(context);
  toast.removeCustomToast();
  toast.removeQueuedCustomToasts();
  toast.showToast(
      child: Container(
        width: 600,
        height: 260,
        padding: const EdgeInsets.all(24),
        alignment: Alignment.center,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 0.5, color: MyColor.gray_20),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/icon_logo.svg',
                width: 78.26,
                height: 60,
              ),
              const EmptyBox(height: 24),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
      ),
      gravity: ToastGravity.CENTER,
      toastDuration: const Duration(seconds: 2));
}
