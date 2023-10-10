import 'package:auth/register/domain/entities/register_entity.dart';
import 'package:auth/register/presentation/bloc/register/register_bloc.dart';
import 'package:auth/register/presentation/cubit/register_cubit.dart';
import 'package:auth/register/presentation/pages/register_page.dart';
import 'package:auth/register/presentation/widgets/joined_us_before.dart';
import 'package:auth/register/presentation/widgets/sign_up_with_email.dart';
import 'package:auth/shared/widget/divider_or.dart';
import 'package:auth/shared/widget/third_login_button.dart';
import 'package:core/core.dart';
import 'package:core/core_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class MockRegisterBloc extends MockBloc<RegisterEvent, RegisterState>
    implements RegisterBloc {}

class FakeRegisterState extends Fake implements RegisterState {}

class FakeRegisterEntity extends Fake implements RegisterEntity {}

void main() {
  late RegisterBloc mockRegisterBloc;
  late RegisterState fakeRegisterState;
  late RegisterCubit registerCubit;

  setUpAll(
    () {
      mockRegisterBloc = MockRegisterBloc();
      fakeRegisterState = FakeRegisterState();

      when(() => mockRegisterBloc.state).thenReturn(fakeRegisterState);
      locator.registerFactory(() => mockRegisterBloc);

      registerCubit = RegisterCubit(registerBloc: locator());
      locator.registerFactory(() => registerCubit);
    },
  );

  tearDownAll(() {
    registerCubit.close();
  });

  Widget makeWidget() => const MaterialAppTest(child: RegisterPage());
  testWidgets("RegisterPage widget test", (WidgetTester tester) async {
    await tester.pumpWidget(makeWidget());

    final BuildContext context = tester.element(find.byType(RegisterPage));

    expect(find.text(context.s.register), findsOneWidget);
    expect(find.byType(SignUpWithEmail, skipOffstage: false), findsOneWidget);
    expect(find.byType(DividerOr, skipOffstage: false), findsOneWidget);
    expect(find.byType(ThirdLoginButton, skipOffstage: false), findsOneWidget);
    expect(find.byType(JoinedUsBefore, skipOffstage: false), findsOneWidget);

    await tester.tap(find.byKey(const Key('buttonSignInWithFacebook')));
    await tester.tap(find.byKey(const Key('buttonSignInWithGoogle')));
    await tester.tap(find.byKey(const Key('buttonSignInWithApple')));

    // test function sign in social media, for now skip cause empty
  });

  testWidgets("Show snackbar error if bloc register return failed",
      (WidgetTester tester) async {
    whenListen(
      locator<RegisterBloc>(),
      Stream.fromIterable(
        [
          RegisterInitial(),
          RegisterFailed(const InternalFailure('failed')),
        ],
      ),
      initialState: RegisterInitial(),
    );

    await tester.pumpWidget(makeWidget());
    expect(find.byKey(const Key('snackbarError')), findsNothing);
    await tester.pump();

    expect(find.byKey(const Key('snackbarError')), findsOneWidget);
  });

  testWidgets("Navigate to main after bloc listerner has success",
      (WidgetTester tester) async {
    whenListen(
      locator<RegisterBloc>(),
      Stream.fromIterable(
        [
          RegisterInitial(),
          RegisterSuccess(FakeRegisterEntity()),
        ],
      ),
      initialState: RegisterInitial(),
    );

    await tester.pumpWidget(makeWidget());

    final BuildContext context = tester.element(find.byType(RegisterPage));
    await tester.pump();

    verify(() => context.goToHome()).called(1);
  });
}
