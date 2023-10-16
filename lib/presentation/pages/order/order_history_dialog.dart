import 'package:check_order/core/theme/app_theme.dart';
import 'package:check_order/core/utils/extension.dart';
import 'package:check_order/presentation/providers/order/order_provider.dart';
import 'package:check_order/presentation/widgets/common/dialog_title.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../../dependencies_injection.dart';

class OrderHistoryDialog extends StatefulWidget {
  const OrderHistoryDialog({
    super.key,
  });

  @override
  State<OrderHistoryDialog> createState() => _OrderHistoryDialogState();
}

class _OrderHistoryDialogState extends State<OrderHistoryDialog> {
  final _orderProvider = sl<OrderProvider>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 36, right: 36),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 36, bottom: 8),
            child: DialogTitle(title: '주문 내역'),
          ),
          Expanded(child: _buildTable),
          const Divider(height: 1, color: kPrimaryColor),
          _buildTotal,
        ],
      ),
    );
  }

  Widget _buildTableHeader({
    required String label,
    bool isRight = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        label,
        style: const TextStyle(
          color: kPrimaryColor,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        textAlign: isRight ? TextAlign.right : TextAlign.left,
      ),
    );
  }

  Widget _buildTableItem({
    required String label,
    bool isRight = false,
    bool isBold = true,
  }) {
    return Container(
      alignment: isRight ? Alignment.centerRight : Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 20,
          fontWeight: isBold ? FontWeight.w700 : FontWeight.w500,
        ),
        textAlign: isRight ? TextAlign.right : TextAlign.left,
      ),
    );
  }

  Widget get _buildTable {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: const <int, TableColumnWidth>{
        0: FixedColumnWidth(426),
        1: FixedColumnWidth(128),
        2: FixedColumnWidth(202),
        3: FixedColumnWidth(202),
      },
      children: [
        TableRow(
          decoration: const BoxDecoration(
              border: Border(
            top: BorderSide(color: kPrimaryColor),
            bottom: BorderSide(color: kPrimaryColor),
          )),
          children: [
            _buildTableHeader(label: '상품명'),
            _buildTableHeader(label: '수량'),
            _buildTableHeader(label: '상품 금액'),
            _buildTableHeader(label: '주문 금액', isRight: true),
          ],
        ),
        ..._orderProvider.items.mapIndexed(
          (index, e) => TableRow(
            decoration: BoxDecoration(
                border: index + 1 == _orderProvider.items.length
                    ? null
                    : const Border(
                        bottom:
                            BorderSide(color: Color(0xFFD5D5D5), width: 1))),
            children: [
              _buildTableItem(label: e.item.name),
              _buildTableItem(label: e.count.toCommaString()),
              _buildTableItem(label: '${e.item.price.toCommaString()}원'),
              _buildTableItem(
                label: '${e.totalAmount.toCommaString()}원',
                isRight: true,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget get _buildTotal {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 33),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            '합계',
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            '${_orderProvider.items.map((e) => e.totalAmount).sum.toCommaString()}원',
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: kPrimaryColor,
              fontSize: 32,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}
