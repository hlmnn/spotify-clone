import 'package:auth/register/presentation/bloc/register/register_bloc.dart';
import 'package:auth/register/presentation/cubit/register_cubit.dart';
import 'package:auth/register/presentation/widgets/joined_us_before.dart';
import 'package:core/core.dart';
import 'package:core/core_test.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';

class MockRegisterBloc extends MockBloc<RegisterEvent, RegisterState>
    implements RegisterBloc {}

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
  testWidgets("JoinedUsBefore widget test", (WidgetTester tester) async {
    final mockRegisterBloc = MockRegisterBloc();

    await tester.pumpWidget(
      BlocProvider(
        create: (context) => RegisterCubit(registerBloc: mockRegisterBloc),
        child: const MaterialAppTest(
          child: JoinedUsBefore(),
        ),
      ),
    );

    final BuildContext context = tester.element(find.byType(JoinedUsBefore));

    expect(
      find.text('${context.s.joinedUsBefore} ${context.s.login}'),
      findsOneWidget,
    );

    richTextOnTap(
        find.byKey(const Key('joinedUsBefore')), ' ${context.s.login}');
    await tester.pumpAndSettle();
    verify(() => context.pop()).called(1);
  });
}
