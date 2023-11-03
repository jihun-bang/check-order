import 'package:flutter/material.dart';

class MenuImage extends StatelessWidget {
  final double width;
  final double height;
  final String imageUrl;

  const MenuImage({
    super.key,
    this.width = 200,
    this.height = 200,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: width,
        height: height,
        child: imageUrl.isNotEmpty
            ? Image.asset(imageUrl, fit: BoxFit.cover)
            : Image.asset('assets/images/img_test_menu.png', fit: BoxFit.cover),
      ),
    );
  }
}
