import 'package:check_order/core/theme/app_theme.dart';
import 'package:check_order/core/theme/color.dart';
import 'package:flutter/material.dart';

class MenuCategoryIndicator extends StatefulWidget {
  final int selectedIndex;
  final List<String> categories;
  final Function(int) onTap;

  const MenuCategoryIndicator({
    super.key,
    required this.selectedIndex,
    required this.categories,
    required this.onTap,
  });

  @override
  State<MenuCategoryIndicator> createState() => _MenuCategoryIndicatorState();
}

class _MenuCategoryIndicatorState extends State<MenuCategoryIndicator> {
  double indicatorLeft = 0;
  double indicatorWidth = 0;

  @override
  void initState() {
    super.initState();

    calculateIndicatorPosition(0);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 904,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          const Positioned.fill(
            bottom: 1,
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: MyColor.gray_20, width: 2),
                ),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
                widget.categories.length, (index) => buildText(index)),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOutCubic,
            left: indicatorLeft,
            child: Container(
              height: 4,
              width: indicatorWidth,
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildText(int index) {
    final isSelected = widget.selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          calculateIndicatorPosition(index);
        });
        widget.onTap.call(index);
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 12, right: 48),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (isSelected) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                calculateIndicatorPosition(index);
              });
            }

            return Text(widget.categories[index],
                style: TextStyle(
                  color: isSelected ? kPrimaryColor : null,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ));
          },
        ),
      ),
    );
  }

  void calculateIndicatorPosition(int index) {
    double leftPosition = 0;
    late TextPainter textPainter;

    for (int i = 0; i <= index; i++) {
      textPainter = TextPainter(
        text: TextSpan(
          text: widget.categories[i],
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        maxLines: 1,
        textDirection: TextDirection.ltr,
      );

      textPainter.layout(minWidth: 0, maxWidth: double.infinity);

      if (i < index) {
        leftPosition += textPainter.width + 44;
      }
    }

    setState(() {
      indicatorLeft = leftPosition;
      indicatorWidth = textPainter.width - 2;
    });
  }
}
