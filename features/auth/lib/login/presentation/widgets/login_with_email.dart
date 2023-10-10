import 'package:auth/login/presentation/cubit/login_cubit.dart';
import 'package:auth/shared/helper/validator_value_helper.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../bloc/login/login_bloc.dart';

class LoginWithEmail extends StatelessWidget {
  const LoginWithEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final watchLoginState = context.watch<LoginBloc>().state;

    final emailKey = context.select((LoginCubit element) => element.emailKey);
    final passwordKey =
        context.select((LoginCubit element) => element.passwordKey);

    return Column(
      children: [
        GitsTextField(
          key: emailKey,
          textfieldKey: const ValueKey(GitsDataTesId.inputEmail),
          title: context.s.email,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(hintText: context.s.yourEmail),
          validator: ValidatorValueHelper.validatorEmail,
          textInputAction: TextInputAction.next,
        ),
        const GitsSpacing.vertical16(),
        GitsTextField(
          key: passwordKey,
          textfieldKey: const ValueKey(GitsDataTesId.inputPassword),
          isPassword: true,
          title: context.s.password,
          decoration: const InputDecoration(hintText: '******'),
          validator: ValidatorValueHelper.validatorPassword,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GitsButton.text(
              key: const ValueKey(GitsDataTesId.buttonAccountDemo),
              isExpand: false,
              text: context.s.accountDemo,
              onPressed: () =>
                  context.read<LoginCubit>().onAccountDemoPressed(context),
            ),
            GitsButton.text(
              key: const ValueKey(GitsDataTesId.buttonForgotPassword),
              isExpand: false,
              text: '${context.s.forgotPassword}?',
              onPressed: () =>
                  context.read<LoginCubit>().onForgotPasswordPressed(context),
            ),
          ],
        ),
        const GitsSpacing.vertical16(),
        GitsButton.elevated(
          key: const ValueKey(GitsDataTesId.buttonLoginWithEmail),
          isLoading: watchLoginState is LoginLoading,
          text: context.s.loginWithEmail,
          onPressed: () =>
              context.read<LoginCubit>().onLoginWithEmailPressed(context),
        ),
      ],
    );
  }
}
