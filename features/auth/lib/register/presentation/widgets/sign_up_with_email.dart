import 'package:auth/shared/helper/validator_value_helper.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../bloc/register/register_bloc.dart';
import '../cubit/register_cubit.dart';

class SignUpWithEmail extends StatelessWidget {
  const SignUpWithEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final watchRegisterState = context.watch<RegisterBloc>().state;

    final emailKey =
        context.select((RegisterCubit element) => element.emailKey);
    final passwordKey =
        context.select((RegisterCubit element) => element.passwordKey);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GitsTextField(
          key: emailKey,
          title: context.s.email,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(hintText: context.s.yourEmail),
          validator: ValidatorValueHelper.validatorEmail,
          textInputAction: TextInputAction.next,
        ),
        const GitsSpacing.vertical16(),
        GitsTextField(
          key: passwordKey,
          isPassword: true,
          title: context.s.password,
          decoration: const InputDecoration(hintText: '******'),
          validator: ValidatorValueHelper.validatorPassword,
        ),
        GitsButton.text(
          isExpand: false,
          text: context.s.accountDemo,
          onPressed: () =>
              context.read<RegisterCubit>().onAccountDemoPressed(context),
        ),
        const GitsSpacing.vertical16(),
        GitsButton.elevated(
          key: const ValueKey('buttonSignUpWithEmail'),
          isLoading: watchRegisterState is RegisterLoading,
          text: context.s.signUpWithEmail,
          onPressed: () =>
              context.read<RegisterCubit>().onSignUpWithEmailPressed(context),
        ),
      ],
    );
  }
}
