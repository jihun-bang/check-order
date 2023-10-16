import 'package:check_order/core/theme/color.dart';
import 'package:check_order/presentation/widgets/employee_call/employee_call_menu_item.dart';
import 'package:flutter/material.dart';

import '../../widgets/common/dialog_title.dart';

class EmployeeCallDialog extends StatefulWidget {
  const EmployeeCallDialog({
    super.key,
  });

  @override
  State<EmployeeCallDialog> createState() => _EmployeeCallDialogState();
}

class _EmployeeCallDialogState extends State<EmployeeCallDialog> {
  static const List<String> _menuItems = [
    '직원호출',
    '냅킨',
    '국그릇',
    '숟가락',
    '젓가락',
    '핸드폰 충전',
    '숟가락',
    '담요',
    '앞접시',
    '테이블 정리',
    '물컵',
  ];
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 36, right: 36, bottom: 36),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 36),
            child: DialogTitle(title: '직원 호출'),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 30),
            child: Divider(
              thickness: 1,
              height: 1,
              color: MyColor.gray_30,
            ),
          ),
          Expanded(child: _buildMenuItems),
        ],
      ),
    );
  }

  Widget get _buildMenuItems {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 145 / 100,
        crossAxisCount: 6,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: _menuItems.length,
      itemBuilder: (_, index) {
        return EmployeeCallMenuItem(
          label: _menuItems[index],
          isSelected: _selectedIndex == index,
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
          },
        );
      },
    );
  }
}
