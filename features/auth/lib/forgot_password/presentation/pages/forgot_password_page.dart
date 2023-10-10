import 'package:auth/forgot_password/presentation/bloc/forgot_password/forgot_password_bloc.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../shared/helper/validator_value_helper.dart';
import '../cubit/forgot_password_cubit.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage>
    with GitsStatePage<ForgotPasswordPage, ForgotPasswordCubit> {
  @override
  ForgotPasswordCubit setCubit() => locator();

  @override
  Widget buildWidget(BuildContext context) {
    final forgotPasswordBloc = context.watch<ForgotPasswordBloc>().state;

    final emailKey =
        context.select((ForgotPasswordCubit element) => element.emailKey);

    return Scaffold(
      appBar: AppBar(title: Text(context.s.forgotPassword)),
      body: ListView(
        padding: const EdgeInsets.all(GitsSizes.s16),
        children: [
          GitsText.bodyMedium(
            context.s.messageForgotPassword,
            color: context.color.grey,
          ),
          const GitsSpacing.vertical16(),
          GitsTextField(
            key: emailKey,
            title: context.s.email,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(hintText: context.s.yourEmail),
            validator: ValidatorValueHelper.validatorEmail,
            // validatorValue: validatorEmail,
          ),
          const GitsSpacing.vertical32(),
          GitsButton.elevated(
            key: const ValueKey('buttonForgotPassword'),
            isLoading: forgotPasswordBloc is ForgotPasswordLoading,
            text: context.s.forgotPassword,
            onPressed: () => cubit.onForgotPasswordPressed(context),
          ),
        ],
      ),
    );
  }
}
