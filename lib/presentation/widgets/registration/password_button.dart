import 'package:flutter/material.dart';

class PasswordButton extends StatelessWidget {
  final String number;
  final VoidCallback onTap;

  const PasswordButton({
    super.key,
    required this.number,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFFD5D5D5)),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: OutlinedButton(
          onPressed: onTap,
          style: OutlinedButton.styleFrom(
              fixedSize: const Size(110, 110),
              alignment: Alignment.center,
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: const BorderSide(),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(8),
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xFF2B2B2B),
              textStyle: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w600,
              )),
          child: Text(
            number,
            textAlign: TextAlign.center,
          ),
        ));
  }
}
