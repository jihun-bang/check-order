import 'package:check_order/core/theme/color.dart';
import 'package:check_order/presentation/providers/employee_call/employee_call_provider.dart';
import 'package:check_order/presentation/widgets/employee_call/employee_call_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../dependencies_injection.dart';
import '../../widgets/common/dialog_title.dart';
import 'employee_call_menu_dialog.dart';

class EmployeeCallDialog extends StatefulWidget {
  const EmployeeCallDialog({
    super.key,
  });

  @override
  State<EmployeeCallDialog> createState() => _EmployeeCallDialogState();
}

class _EmployeeCallDialogState extends State<EmployeeCallDialog> {
  final _provider = sl<EmployeeCallProvider>();

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
    return Consumer<EmployeeCallProvider>(builder: (_, __, ___) {
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 145 / 100,
          crossAxisCount: 6,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: _provider.items.length,
        itemBuilder: (_, index) {
          final item = _provider.items[index];
          return EmployeeCallMenuItem(
            label: item.name,
            isSelected: _provider.isSelectedItem(item.id),
            onTap: () {
              _provider.addItem(item);
              showDialog(
                  barrierColor: Colors.transparent,
                  context: context,
                  barrierDismissible: true,
                  useSafeArea: false,
                  builder: (_) {
                    return const Dialog(
                      alignment: Alignment.centerRight,
                      insetPadding: EdgeInsets.only(right: 129),
                      child: EmployeeCallMenuDialog(),
                    );
                  });
            },
          );
        },
      );
    });
  }
}
