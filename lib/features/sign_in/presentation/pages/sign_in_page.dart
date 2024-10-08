import 'package:check_order/core/router/route_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/data/remote/models/user/user_model.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_style.dart';
import '../../../../core/widgets/buttons/app_button.dart';
import '../../../../core/widgets/text_field/app_text_field.dart';
import '../../../dialog/show_message_toast.dart';
import '../providers/sign_in_request_provider.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

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
                _buildEmail,
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 50),
                  child: _buildPassword,
                ),
                _buildSignIn,
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
          Container(
            width: 153,
            height: 36,
            alignment: Alignment.center,
            decoration: ShapeDecoration(
              color: AppColors.gray10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            child: Text(
              '체크 관리자',
              style: AppTextStyle.body14b140.copyWith(color: AppColors.gray60),
            ),
          ),
        ],
      ),
    );
  }

  Widget get _buildEmail {
    return Consumer(builder: (context, ref, _) {
      return AppTextField(
        label: '이메일',
        onChanged: (value) {
          ref.read(signInRequestProvider.notifier).updateEmail(value);
        },
      );
    });
  }

  Widget get _buildPassword {
    return Consumer(builder: (context, ref, _) {
      return AppTextField(
        label: '비밀번호',
        obscureText: true,
        onChanged: (value) {
          ref.read(signInRequestProvider.notifier).updatePassword(value);
        },
      );
    });
  }

  Widget get _buildSignIn {
    return Consumer(builder: (context, ref, _) {
      final state = ref.watch(signInRequestProvider);
      return AppButton(
        label: '로그인',
        width: 448,
        enable: state.email.isNotEmpty && state.password.isNotEmpty,
        onTap: () async {
          ref.read(signInRequestProvider.notifier).signIn().then((value) async {
            await Future.delayed(const Duration(milliseconds: 200));
            if (context.mounted) {
              switch (value.isAuth) {
                case true:
                  showMessageToast(context: context, message: '로그인 되었습니다.');
                  context.goNamed(RouteList.tableRegistration.name);
                case false:
                  showMessageToast(
                      context: context,
                      message: (value as SignedOut).message ?? '');
              }
            }
          });
        },
      );
    });
  }
}
