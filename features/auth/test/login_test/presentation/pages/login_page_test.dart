import 'package:auth/login/domain/entities/login_entity.dart';
import 'package:auth/login/presentation/bloc/login/login_bloc.dart';
import 'package:auth/login/presentation/cubit/login_cubit.dart';
import 'package:auth/login/presentation/pages/login_page.dart';
import 'package:auth/login/presentation/widgets/widgets.dart';
import 'package:auth/shared/widget/widget.dart';
import 'package:core/core.dart';
import 'package:core/core_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

class FakeLoginState extends Fake implements LoginState {}

class FakeLoginEntity extends Fake implements LoginEntity {}

void main() {
  late LoginBloc mockLoginBloc;
  late LoginState fakeLoginState;
  late LoginCubit loginCubit;

  setUpAll(
    () {
      mockLoginBloc = MockLoginBloc();
      fakeLoginState = FakeLoginState();
      locator.registerFactory(() => mockLoginBloc);

      loginCubit = LoginCubit(loginBloc: locator());
      locator.registerFactory(() => loginCubit);
    },
  );

  tearDownAll(() {
    loginCubit.close();
  });

  Widget makeWidget() => const MaterialAppTest(child: LoginPage());

  testWidgets("LoginPage widget test", (WidgetTester tester) async {
    when(() => mockLoginBloc.state).thenReturn(fakeLoginState);

    await tester.pumpWidget(makeWidget());

    final BuildContext context = tester.element(find.byType(LoginPage));

    expect(find.text(context.s.login), findsOneWidget);
    expect(find.byType(ThirdLoginButton, skipOffstage: false), findsOneWidget);
    expect(find.byType(LoginWithEmail, skipOffstage: false), findsOneWidget);
    expect(find.byType(NewRegister, skipOffstage: false), findsOneWidget);

    await tester.tap(find.byKey(const Key('buttonSignInWithFacebook')));
    await tester.tap(find.byKey(const Key('buttonSignInWithGoogle')));
    await tester.tap(find.byKey(const Key('buttonSignInWithApple')));

    // test function sign in social media, for now skip cause empty
  });

  testWidgets("Show snackbar error if bloc login return failed",
      (WidgetTester tester) async {
    whenListen(
      locator<LoginBloc>(),
      Stream.fromIterable(
        [
          LoginInitial(),
          LoginFailed(const InternalFailure('failed')),
        ],
      ),
      initialState: LoginInitial(),
    );

    await tester.pumpWidget(makeWidget());
    expect(find.byKey(const Key('snackbarError')), findsNothing);
    await tester.pump();

    expect(find.byKey(const Key('snackbarError')), findsOneWidget);
  });

  testWidgets("Navigate to main after bloc listerner has success",
      (WidgetTester tester) async {
    whenListen(
      locator<LoginBloc>(),
      Stream.fromIterable(
        [
          LoginInitial(),
          LoginSuccess(FakeLoginEntity()),
        ],
      ),
      initialState: LoginInitial(),
    );

    await tester.pumpWidget(makeWidget());

    final BuildContext context = tester.element(find.byType(LoginPage));
    await tester.pump();

    verify(() => context.goToHome()).called(1);
  });
}
