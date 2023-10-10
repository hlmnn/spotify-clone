import 'package:auth/shared/widget/divider_or.dart';
import 'package:core/core.dart';
import 'package:core/core_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("DividerOr widget test", (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialAppTest(child: DividerOr()));

    final BuildContext context = tester.element(find.byType(DividerOr));

    expect(find.byKey(const Key('dividerLine')), findsNWidgets(2));
    expect(find.text(context.s.or), findsOneWidget);
  });
}
