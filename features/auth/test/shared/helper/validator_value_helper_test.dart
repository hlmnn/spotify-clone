import 'package:auth/shared/helper/validator_value_helper.dart';
import 'package:core/core.dart';
import 'package:core/core_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Validation email test", (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialAppTest(child: Scaffold()));

    final BuildContext context = tester.element(find.byType(Scaffold));

    final correct =
        ValidatorValueHelper.validatorEmail(context, 'dena@gits.id');
    expect(correct, null);

    final incorrect = ValidatorValueHelper.validatorEmail(context, 'dena@gits');
    expect(
      incorrect,
      ValidatorValue(
        message: context.s.emailError,
        showStatusMessage: ShowStatusMessage.error,
      ),
    );
  });

  testWidgets("Validation password test", (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialAppTest(child: Scaffold()));

    final BuildContext context = tester.element(find.byType(Scaffold));

    final correct = ValidatorValueHelper.validatorPassword(context, 'password');
    expect(correct, null);

    final incorrect = ValidatorValueHelper.validatorPassword(context, 'pass');
    expect(
      incorrect,
      ValidatorValue(
        message: context.s.passwordError,
        showStatusMessage: ShowStatusMessage.error,
      ),
    );
  });

  testWidgets("Validation valid email and password test",
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialAppTest(child: Scaffold()));

    final BuildContext context = tester.element(find.byType(Scaffold));

    final correct = ValidatorValueHelper.isValidEmailAndPassword(
        context, 'dena@gits.id', 'password');
    expect(correct, true);

    final incorrect = ValidatorValueHelper.isValidEmailAndPassword(
        context, 'dena@gits.id', 'pass');
    expect(incorrect, false);
  });
}
