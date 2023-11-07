import 'package:check_order/core/theme/app_theme.dart';
import 'package:check_order/core/theme/color.dart';
import 'package:check_order/presentation/dialog/show_logo_message_toast.dart';
import 'package:check_order/presentation/providers/cart/cart_provider.dart';
import 'package:check_order/presentation/providers/employee_call/employee_call_provider.dart';
import 'package:check_order/presentation/widgets/common/button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../dependencies_injection.dart';
import '../../widgets/employee_call/employee_call_counter_item.dart';

class EmployeeCallMenuDialog extends StatefulWidget {
  const EmployeeCallMenuDialog({
    super.key,
  });

  @override
  State<EmployeeCallMenuDialog> createState() => _EmployeeCallMenuDialogState();
}

class _EmployeeCallMenuDialogState extends State<EmployeeCallMenuDialog> {
  final _provider = sl<EmployeeCallProvider>();

  Future<void> _call() async {
    final success = await _provider.call();
    if (mounted) {
      final message = success ? '직원을 호출했습니다!' : '직원 호출을 실패했습니다.';
      if (success) {
        Navigator.pop(context);
        Navigator.pop(context);
      }
      showLogoMessageToast(context: context, message: message);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 312,
      height: 660,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Consumer<CartProvider>(
        builder: (_, __, titleBar) {
          return Column(
            children: [
              titleBar ?? const SizedBox(),
              const Divider(
                color: MyColor.gray_10,
                thickness: 4,
                height: 4,
              ),
              Expanded(child: _buildItems),
              _buildCall,
            ],
          );
        },
      ),
    );
  }

  Widget get _buildItems {
    return Consumer<EmployeeCallProvider>(builder: (_, __, ___) {
      return ListView.builder(
        itemBuilder: (_, index) {
          return EmployeeCallCounterItem(
            item: _provider.selectedItems[index],
            onDeleteItem: (id) {
              _provider.deleteItem(id);
              if (_provider.selectedItems.isEmpty) {
                Navigator.pop(context);
              }
            },
            onAddItem: (item) {
              _provider.addItem(item);
            },
            onRemoveItem: (id) {
              _provider.removeItem(id);
            },
          );
        },
        itemCount: _provider.selectedItems.length,
      );
    });
  }

  Widget get _buildCall {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: CheckOrderButton(
        label: '직원 호출',
        color: kPrimaryColor,
        width: 248,
        onTap: () async {
          await _call();
        },
      ),
    );
  }
}
