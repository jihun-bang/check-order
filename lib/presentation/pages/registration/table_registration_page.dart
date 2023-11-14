import 'package:check_order/core/router/route_list.dart';
import 'package:check_order/core/theme/app_theme.dart';
import 'package:check_order/data/models/table/table_info_model.dart';
import 'package:check_order/data/service/auth_service.dart';
import 'package:check_order/presentation/dialog/show_logo_message_toast.dart';
import 'package:check_order/presentation/widgets/common/button.dart';
import 'package:check_order/presentation/widgets/common/empty_box.dart';
import 'package:check_order/presentation/widgets/common/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../dependencies_injection.dart';
import '../../widgets/registration/page_info_label.dart';

class TableRegistrationPage extends StatefulWidget {
  const TableRegistrationPage({super.key});

  @override
  State<TableRegistrationPage> createState() => _TableRegistrationPageState();
}

class _TableRegistrationPageState extends State<TableRegistrationPage> {
  final _auth = sl<AuthService>();

  Future<void> _tableRegistration() async {
    final success = await _auth.save();
    if (mounted) {
      if (success) {
        showLogoMessageToast(context: context, message: '연결중입니다...');
        await Future.delayed(const Duration(seconds: 2)).then((_) {
          if (true) {
            showLogoMessageToast(context: context, message: '성공적으로 연결되었습니다.');
            context.goNamed(RouteList.home.name);
          }
        });
      } else {
        showLogoMessageToast(context: context, message: '연결을 실패했습니다.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        _appBar,
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ip,
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: _tableName,
              ),
              _memo,
              const EmptyBox(height: 22),
              _confirm,
            ],
          ),
        ),
      ],
    ));
  }

  Widget get _appBar {
    return Padding(
      padding: const EdgeInsets.only(left: 67, right: 67, top: 34),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset('assets/icons/icon_logo_h.svg'),
          const PageInfoLabel(label: '테이블 등록'),
        ],
      ),
    );
  }

  Widget get _ip {
    return CheckOrderTextField(
      label: 'IP 주소',
      hintText: '128.0.0.1',
      onChanged: (value) {
        _auth.update(_auth.tableInfo.copyWith(ipAddress: value));
      },
    );
  }

  Widget get _tableName {
    return CheckOrderTextField(
      label: '테이블 이름',
      hintText: '테이블 1번',
      onChanged: (value) {
        _auth.update(_auth.tableInfo.copyWith(tableName: value));
      },
    );
  }

  Widget get _memo {
    return CheckOrderTextField(
      label: '메모 (선택)',
      labelColor: const Color(0xFF8A8A8A),
      hintText: '우측 창가',
      onChanged: (value) {
        _auth.update(_auth.tableInfo.copyWith(description: value));
      },
    );
  }

  Widget get _confirm {
    return CheckOrderButton(
        label: '등록하기',
        color: kSecondaryColor,
        width: 448,
        onTap: () async {
          await _tableRegistration();
        });
  }
}
