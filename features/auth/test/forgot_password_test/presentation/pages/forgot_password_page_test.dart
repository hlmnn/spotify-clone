import 'package:auth/forgot_password/data/models/body/forgot_password_body.dart';
import 'package:auth/forgot_password/presentation/bloc/forgot_password/forgot_password_bloc.dart';
import 'package:auth/forgot_password/presentation/cubit/forgot_password_cubit.dart';
import 'package:auth/forgot_password/presentation/pages/forgot_password_page.dart';
import 'package:core/core.dart';
import 'package:core/core_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class MockForgotPasswordBloc
    extends MockBloc<ForgotPasswordEvent, ForgotPasswordState>
    implements ForgotPasswordBloc {}

class FakeForgotPasswordState extends Fake implements ForgotPasswordState {}

void main() {
  late ForgotPasswordBloc mockForgotPasswordBloc;
  late ForgotPasswordState fakeForgotPasswordState;
  late ForgotPasswordCubit forgotPasswordCubit;

  setUpAll(
    () {
      mockForgotPasswordBloc = MockForgotPasswordBloc();
      fakeForgotPasswordState = FakeForgotPasswordState();
      locator.registerFactory(() => mockForgotPasswordBloc);

      forgotPasswordCubit = ForgotPasswordCubit(forgotPasswordBloc: locator());
      locator.registerFactory(() => forgotPasswordCubit);
    },
  );

  tearDownAll(() {
    forgotPasswordCubit.close();
  });

  Widget makeWidget() => const MaterialAppTest(child: ForgotPasswordPage());

  testWidgets("ForgotPasswordPage widget test", (WidgetTester tester) async {
    when(() => mockForgotPasswordBloc.state)
        .thenReturn(fakeForgotPasswordState);

    await tester.pumpWidget(makeWidget());

    final BuildContext context =
        tester.element(find.byType(ForgotPasswordPage));

    expect(find.text(context.s.forgotPassword), findsNWidgets(2));
    expect(find.text(context.s.messageForgotPassword), findsOneWidget);
    expect(find.text(context.s.email), findsOneWidget);
    expect(find.byKey(const Key('buttonForgotPassword')), findsOneWidget);

    expect(find.text(context.s.emailError), findsNothing);
    await tester.tap(find.byKey(const Key('buttonForgotPassword')));
    await tester.pumpAndSettle();
    expect(find.text(context.s.emailError), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'dena@gits.id');
    await tester.pumpAndSettle();
    expect(find.text(context.s.emailError), findsNothing);

    await tester.tap(find.byKey(const Key('buttonForgotPassword')));
    verify(
      () => mockForgotPasswordBloc.add(
        FetchForgotPassword(
          const ForgotPasswordBody(delay: 30),
        ),
      ),
    );
  });

  testWidgets("Show snackbar error if bloc forgot password return failed",
      (WidgetTester tester) async {
    whenListen(
      locator<ForgotPasswordBloc>(),
      Stream.fromIterable(
        [
          ForgotPasswordInitial(),
          ForgotPasswordFailed(const InternalFailure('failed')),
        ],
      ),
      initialState: ForgotPasswordInitial(),
    );

    await tester.pumpWidget(makeWidget());
    expect(find.byKey(const Key('snackbarError')), findsNothing);
    await tester.pump();

    expect(find.byKey(const Key('snackbarError')), findsOneWidget);
  });
}
