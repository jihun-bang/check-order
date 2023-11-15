import 'package:check_order/data/service/auth_service.dart';
import 'package:check_order/presentation/widgets/registration/page_info_label.dart';
import 'package:check_order/presentation/widgets/registration/password_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/route_list.dart';
import '../../../dependencies_injection.dart';
import '../../dialog/show_logo_message_toast.dart';

class TablePasswordPage extends StatefulWidget {
  const TablePasswordPage({super.key});

  @override
  State<TablePasswordPage> createState() => _TablePasswordPageState();
}

class _TablePasswordPageState extends State<TablePasswordPage> {
  final _validPassword = '1234';
  final _password = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    'C',
    '0',
    '<'
  ];
  List<int> _inputPassword = [-1, -1, -1, -1];
  final _auth = sl<AuthService>();
  int get _passwordCount =>
      _inputPassword.where((password) => password != -1).length;

  Future<void> _login() async {
    if (_inputPassword.map((e) => e.toString()).join('') == _validPassword) {
      if (mounted) {
        showLogoMessageToast(context: context, message: '로그인 중입니다...');
        await Future.delayed(const Duration(seconds: 1)).then((_) {
          if (true) {
            showLogoMessageToast(context: context, message: '성공적으로 로그인되었습니다.');
            context.goNamed(RouteList.admin.name);
          }
        });
      }
    } else {
      setState(() {
        _inputPassword = [-1, -1, -1, -1];
      });
      showLogoMessageToast(context: context, message: '비밀번호가 맞지 않습니다.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        _appBar,
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: 101),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTitle,
                    _buildPasswordIndicator,
                  ],
                ),
              )),
              _buildPassword,
            ],
          ),
        ),
        Container(
            height: 43,
            color: const Color(0xFFF1F1F1),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 100),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 18),
                  child: Text(
                    '테이블 이름',
                    style: TextStyle(
                      color: Color(0xFF5F5F5F),
                    ),
                  ),
                ),
                Text(
                  _auth.tableInfo.tableName,
                  style: const TextStyle(
                    color: Color(0xFF191818),
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ))
      ],
    ));
  }

  Widget get _buildTitle {
    return const Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '체크 대시보드에서 설정한\n',
            style: TextStyle(
              color: Color(0xFF2B2B2B),
              fontSize: 40,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextSpan(
            text: '테블릿 비밀번호',
            style: TextStyle(
              color: Color(0xFFFF8C22),
              fontSize: 40,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextSpan(
            text: '를 입력하세요.',
            style: TextStyle(
              color: Color(0xFF2B2B2B),
              fontSize: 40,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget get _buildPasswordIndicator {
    return Container(
      margin: const EdgeInsets.only(top: 91),
      height: 24,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, index) => Container(
                width: 24,
                height: 24,
                decoration: ShapeDecoration(
                  color: Color(
                      _inputPassword[index] != -1 ? 0xFF5F5F5F : 0xFFD9D9D9),
                  shape: const OvalBorder(),
                ),
              ),
          separatorBuilder: (_, __) => const SizedBox(width: 23),
          itemCount: 4),
    );
  }

  Widget get _appBar {
    return Padding(
      padding: const EdgeInsets.only(left: 67, right: 67, top: 34),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset('assets/icons/icon_logo_h.svg'),
          const PageInfoLabel(label: '관리자 로그인'),
        ],
      ),
    );
  }

  Widget get _buildPassword {
    return Container(
      width: 350,
      margin: const EdgeInsets.only(right: 81),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1,
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          mainAxisExtent: 110,
        ),
        itemCount: _password.length,
        itemBuilder: (_, index) {
          final item = _password.elementAt(index);
          return PasswordButton(
            number: item,
            onTap: () async {
              final number = int.tryParse(item);

              setState(() {
                if (number != null) {
                  if (_passwordCount < 4) {
                    _inputPassword[_inputPassword.indexOf(-1)] = number;
                  }
                } else if (item == 'C') {
                  _inputPassword = [-1, -1, -1, -1];
                } else {
                  final index = _inputPassword
                      .lastIndexWhere((password) => password != -1);
                  if (index != -1) {
                    _inputPassword[index] = -1;
                  }
                }
              });

              if (_passwordCount == 4) {
                await _login();
              }
            },
          );
        },
      ),
    );
  }
}
