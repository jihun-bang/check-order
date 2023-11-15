import 'package:check_order/core/router/route_list.dart';
import 'package:check_order/core/theme/app_theme.dart';
import 'package:check_order/data/models/table/table_info_model.dart';
import 'package:check_order/data/service/auth_service.dart';
import 'package:check_order/presentation/dialog/show_logo_message_toast.dart';
import 'package:check_order/presentation/dialog/show_message_toast.dart';
import 'package:check_order/presentation/widgets/common/button.dart';
import 'package:check_order/presentation/widgets/common/empty_box.dart';
import 'package:check_order/presentation/widgets/common/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../dependencies_injection.dart';
import '../../widgets/registration/page_info_label.dart';

class TableAdminPage extends StatefulWidget {
  const TableAdminPage({super.key});

  @override
  State<TableAdminPage> createState() => _TableAdminPageState();
}

class _TableAdminPageState extends State<TableAdminPage> {
  final _auth = sl<AuthService>();
  late TableInfoModel _tableInfo;

  Future<void> _reset() async {
    await _auth.logOut();
    if (mounted) {
      showLogoMessageToast(context: context, message: '연동 해제 중입니다...');
      await Future.delayed(const Duration(seconds: 2)).then((_) {
        if (true) {
          showLogoMessageToast(context: context, message: '연동이 해제 되었습니다.');
          context.goNamed(RouteList.home.name);
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();

    _tableInfo = _auth.tableInfo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        _appBar,
        Expanded(
          child: SizedBox(
            width: 552,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _ip,
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: _tableName,
                ),
                _memo,
                const EmptyBox(height: 22),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildReset,
                    const SizedBox(width: 16),
                    _buildBack,
                  ],
                ),
              ],
            ),
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
    return Align(
      alignment: Alignment.centerLeft,
      child: CheckOrderTextField(
        label: 'IP 주소',
        initText: _tableInfo.ipAddress,
        enabled: false,
      ),
    );
  }

  Widget get _tableName {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CheckOrderTextField(
          label: '테이블 이름',
          initText: _tableInfo.tableName,
          hintText: '테이블 1번',
          onChanged: (value) {
            _tableInfo = _tableInfo.copyWith(tableName: value);
          },
        ),
        _buildSave(onSave: () {
          _auth
              .save(
                  tableInfoModel: _tableInfo.copyWith(
                      description: _auth.tableInfo.description))
              .then((value) {
            if (value) {
              showMessageToast(context: context, message: '성공적으로 저장되었습니다.');
            }
          });
        }),
      ],
    );
  }

  Widget get _memo {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CheckOrderTextField(
          label: '메모 (선택)',
          labelColor: const Color(0xFF8A8A8A),
          initText: _tableInfo.description,
          hintText: '우측 창가',
          onChanged: (value) {
            _tableInfo = _tableInfo.copyWith(description: value);
          },
        ),
        _buildSave(
            color: const Color(0xFFF1F1F1),
            labelColor: const Color(0xFF5F5F5F),
            onSave: () {
              _auth
                  .save(
                      tableInfoModel: _tableInfo.copyWith(
                          tableName: _auth.tableInfo.tableName))
                  .then((value) {
                if (value) {
                  showMessageToast(context: context, message: '성공적으로 저장되었습니다.');
                }
              });
            }),
      ],
    );
  }

  Widget _buildSave({
    required VoidCallback onSave,
    Color color = kSecondaryColor,
    Color? labelColor,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, bottom: 13),
      child: CheckOrderButton(
        width: 86,
        height: 48,
        label: '저장',
        labelColor: labelColor,
        onTap: onSave,
        color: color,
      ),
    );
  }

  Widget get _buildReset {
    return CheckOrderButton(
        label: '테이블 연동 해제',
        color: kPrimaryColor,
        width: 268,
        onTap: () async {
          await _reset();
        });
  }

  Widget get _buildBack {
    return CheckOrderButton(
        label: '메뉴판 돌아가기',
        labelColor: const Color(0xFF5F5F5F),
        color: const Color(0xFFF1F1F1),
        width: 268,
        onTap: () async {
          context.goNamed(RouteList.home.name);
        });
  }
}
