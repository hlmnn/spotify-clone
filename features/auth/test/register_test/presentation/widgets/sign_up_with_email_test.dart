import 'package:auth/register/data/models/body/register_body.dart';
import 'package:auth/register/presentation/bloc/register/register_bloc.dart';
import 'package:auth/register/presentation/cubit/register_cubit.dart';
import 'package:auth/register/presentation/widgets/sign_up_with_email.dart';
import 'package:core/core.dart';
import 'package:core/core_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class MockRegisterBloc extends MockBloc<RegisterEvent, RegisterState>
    implements RegisterBloc {}

class FakeRegisterState extends Fake implements RegisterState {}

void main() {
  testWidgets("SignUpWithEmail widget test", (WidgetTester tester) async {
    final RegisterBloc mockRegisterBloc = MockRegisterBloc();
    final RegisterState fakeRegisterState = FakeRegisterState();

    when(() => mockRegisterBloc.state).thenReturn(fakeRegisterState);

    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RegisterCubit(registerBloc: mockRegisterBloc),
          ),
          BlocProvider(create: (context) => mockRegisterBloc)
        ],
        child: const MaterialAppTest(
          child: Scaffold(
            body: SignUpWithEmail(),
          ),
        ),
      ),
    );

    final BuildContext context = tester.element(find.byType(SignUpWithEmail));

    final cubit = context.read<RegisterCubit>();

    // initial
    expect(find.byKey(cubit.emailKey), findsOneWidget);
    expect(find.byKey(cubit.passwordKey), findsOneWidget);
    expect(find.text(context.s.accountDemo), findsOneWidget);
    expect(find.text(context.s.signUpWithEmail), findsOneWidget);

    // Ontap button signup show error validate email & password
    await tester.tap(find.text(context.s.signUpWithEmail));
    await tester.pumpAndSettle();
    expect(find.text(context.s.emailError), findsOneWidget);
    expect(find.text(context.s.passwordError), findsOneWidget);

    // Ontap account demo
    await tester.tap(find.text(context.s.accountDemo));
    await tester.pumpAndSettle();
    expect(find.text('eve.holt@reqres.in'), findsOneWidget);
    expect(find.text('pistol'), findsOneWidget);
    // hide error
    expect(find.text(context.s.emailError), findsNothing);
    expect(find.text(context.s.passwordError), findsNothing);

    // Verify button to call api register
    await tester.tap(find.byKey(const Key('buttonSignUpWithEmail')));
    await tester.pumpAndSettle();
    verify(
      () => mockRegisterBloc.add(
        FetchRegister(
          RegisterBody(
            email: cubit.emailKey.text,
            password: cubit.passwordKey.text,
          ),
        ),
      ),
    ).called(1);
  });
}
