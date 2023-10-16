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
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 36, right: 36),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 36, bottom: 8),
            child: DialogTitle(title: '직원 호출'),
          ),
        ],
      ),
    );
  }
}
