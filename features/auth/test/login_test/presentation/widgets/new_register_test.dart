import 'package:auth/login/presentation/bloc/login/login_bloc.dart';
import 'package:auth/login/presentation/cubit/login_cubit.dart';
import 'package:auth/login/presentation/widgets/widgets.dart';
import 'package:core/core.dart';
import 'package:core/core_test.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';

class MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

void richTextOnTap(Finder finder, String text) {
  final Element element = finder.evaluate().single;
  final RenderParagraph paragraph = element.renderObject as RenderParagraph;
  // The children are the individual TextSpans which have GestureRecognizers
  paragraph.text.visitChildren((dynamic span) {
    if (span.text != text) return true; // continue iterating.

    (span.recognizer as TapGestureRecognizer).onTap?.call();
    return false; // stop iterating, we found the one.
  });
}

void main() {
  testWidgets("NewRegister widget test", (WidgetTester tester) async {
    final LoginBloc mockLoginBloc = MockLoginBloc();

    await tester.pumpWidget(
      BlocProvider(
        create: (context) => LoginCubit(loginBloc: mockLoginBloc),
        child: const MaterialAppTest(
          child: Scaffold(
            body: NewRegister(),
          ),
        ),
      ),
    );

    final BuildContext context = tester.element(find.byType(NewRegister));

    expect(find.text('${context.s.newAccount} ${context.s.register}'),
        findsOneWidget);

    richTextOnTap(
      find.byKey(const Key('newAccountRegister')),
      ' ${context.s.register}',
    );

    verify(() => context.goToRegister());
  });
}
