<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:usedev_uninassau_keven/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNoWidget);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNoWidget);
    expect(find.text('1'), findsOneWidget);
=======
// This is a basic unit test that verifies the app entrypoint compiles.

import 'package:flutter_test/flutter_test.dart';
import 'package:usedev_uninassau/main.dart';

void main() {
  test('MyApp class exists', () {
    expect(const MyApp(), isA<MyApp>());
>>>>>>> 7aa0efc8ec4ab86d3bb63d1d51bb5530b3842920
  });
}
