import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Sesuaikan dengan lokasi MyApp() Anda
void main() {
  testWidgets('Counter increments test', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(
        MyApp() as Widget); // Pastikan MyApp() telah diimpor dengan benar

    // Verify that the counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that the counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}

class MyApp {}
