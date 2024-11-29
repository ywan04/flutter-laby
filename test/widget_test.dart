// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:lab15/main.dart';

double calc(double x) {
	return x - 1/(x*x) + 1 / (3*x);
}

void main() {
	test('calc', () {
		expect(calc(10.0), 10.023333333333333);
	});
  testWidgets('widget', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text("IPZ-31: Ivan's last Flutter App"), findsOneWidget);

    expect(find.byIcon(Icons.person), findsOneWidget);

    await tester.tap(find.byIcon(Icons.person));
    await tester.pump();

    expect(find.text('1'), findsOneWidget);
  });
}
