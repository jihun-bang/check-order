import 'package:check_order/core/theme/color.dart';
import 'package:check_order/data/models/employee_call/employee_call_item.dart';
import 'package:check_order/presentation/widgets/common/counter.dart';
import 'package:flutter/material.dart';

class EmployeeCallCounterItem extends StatelessWidget {
  final EmployeeCallItemModel item;
  final Function(String) onDeleteItem;
  final Function(EmployeeCallItemModel) onAddItem;
  final Function(String) onRemoveItem;

  const EmployeeCallCounterItem({
    super.key,
    required this.item,
    required this.onDeleteItem,
    required this.onAddItem,
    required this.onRemoveItem,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 304,
      height: 128,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: _buildTitle),
          _buildCounter,
          _buildLine,
        ],
      ),
    );
  }

  Widget get _buildTitle {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 240,
          margin: const EdgeInsets.only(left: 32, top: 20, bottom: 16),
          child: Text(
            item.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        _buildClose,
      ],
    );
  }

  Widget get _buildClose {
    return IconButton(
      onPressed: () {
        onDeleteItem.call(item.id);
      },
      constraints: const BoxConstraints(),
      iconSize: 24,
      icon: const Icon(Icons.close, color: MyColor.gray_30),
    );
  }

  Widget get _buildCounter {
    return Padding(
      padding: const EdgeInsets.only(bottom: 21),
      child: Counter(
        value: item.count,
        onPlus: () {
          onAddItem.call(item);
        },
        onMinus: () {
          onRemoveItem.call(item.id);
        },
      ),
    );
  }

  Widget get _buildLine {
    return const Divider(
      color: MyColor.gray_10,
      thickness: 4,
      height: 4,
    );
  }
}
