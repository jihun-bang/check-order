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
        child: _buildTitleBar,
      ),
    );
  }

  Widget get _buildTitleBar {
    return Padding(
      padding: const EdgeInsets.only(left: 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 17, bottom: 14),
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.chevron_left,
                color: kPrimaryColor,
                size: 24,
              ),
            ),
          ),
          const Text(
            '장바구니',
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(width: 24),
        ],
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
              Navigator.pop(context);
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
