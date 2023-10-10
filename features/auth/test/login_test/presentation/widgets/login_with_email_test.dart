import 'package:auth/login/data/models/body/login_body.dart';
import 'package:auth/login/presentation/bloc/login/login_bloc.dart';
import 'package:auth/login/presentation/cubit/login_cubit.dart';
import 'package:auth/login/presentation/widgets/widgets.dart';
import 'package:core/core.dart';
import 'package:core/core_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

class FakeLoginState extends Fake implements LoginState {}

void main() {
  testWidgets("LoginWithEmail widget test", (WidgetTester tester) async {
    final LoginBloc mockLoginBloc = MockLoginBloc();
    final LoginState fakeLoginState = FakeLoginState();

    when(() => mockLoginBloc.state).thenReturn(fakeLoginState);

    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => mockLoginBloc),
          BlocProvider(
            create: (context) => LoginCubit(loginBloc: mockLoginBloc),
          ),
        ],
        child: const MaterialAppTest(
          child: Scaffold(
            body: LoginWithEmail(),
          ),
        ),
      ),
    );

    final BuildContext context = tester.element(find.byType(LoginWithEmail));

    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.text(context.s.email), findsOneWidget);
    expect(find.text(context.s.password), findsOneWidget);
    expect(find.text(context.s.accountDemo), findsOneWidget);
    expect(find.text('${context.s.forgotPassword}?'), findsOneWidget);
    expect(find.text(context.s.loginWithEmail), findsOneWidget);

    // Before tap show nothing then after tap button sign in show error
    expect(find.text(context.s.emailError), findsNothing);
    expect(find.text(context.s.passwordError), findsNothing);
    await tester.tap(find.text(context.s.loginWithEmail));
    await tester.pumpAndSettle();
    expect(find.text(context.s.emailError), findsOneWidget);
    expect(find.text(context.s.passwordError), findsOneWidget);

    // After fill textfield
    await tester.tap(find.text(context.s.accountDemo));
    await tester.pumpAndSettle();
    expect(find.text('eve.holt@reqres.in'), findsOneWidget);
    expect(find.text('cityslicka'), findsOneWidget);
    expect(find.text(context.s.emailError), findsNothing);
    expect(find.text(context.s.passwordError), findsNothing);

    await tester.tap(find.text('${context.s.forgotPassword}?'));
    verify(() => context.goToForgotPassword()).called(1);

    await tester.tap(find.text(context.s.loginWithEmail));
    verify(
      () => mockLoginBloc.add(
        FetchLogin(
          const LoginBody(
            email: 'eve.holt@reqres.in',
            password: 'cityslicka',
          ),
        ),
      ),
    ).called(1);
  });
}
