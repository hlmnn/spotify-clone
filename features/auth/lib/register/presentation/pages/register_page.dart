import 'package:auth/register/presentation/widgets/joined_us_before.dart';
import 'package:auth/register/presentation/widgets/sign_up_with_email.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../shared/widget/widget.dart';
import '../cubit/register_cubit.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with GitsStatePage<RegisterPage, RegisterCubit> {
  @override
  RegisterCubit setCubit() => locator();

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.s.register)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SignUpWithEmail(),
          const GitsSpacing.vertical36(),
          const DividerOr(),
          const GitsSpacing.vertical36(),
          ThirdLoginButton(
            onFacebookPressed: cubit.onLoginWithFacebookPressed,
            onGooglePressed: cubit.onLoginWithGooglePressed,
            onApplePressed: cubit.onLoginWithApplePressed,
          ),
          const GitsSpacing.vertical32(),
          const JoinedUsBefore(),
        ],
      ),
    );
  }
}
