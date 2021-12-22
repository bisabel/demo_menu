import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:menu/navigation.dart';
import 'package:menu/views/initialPage.dart';

void main() {
  testWidgets('initialPage test the button appeared', (tester) async {
    
    ///ASEMBLE
    final Key intialkey = Key("InitialPage");
    await tester.pumpWidget(
      MaterialApp(
        home: InitialPage(key: intialkey)
      )
    );

    final initial = find.byKey(intialkey);
    expect(initial, findsOneWidget);

    final button = find.byType(TextButton);
    expect(button, findsOneWidget);

    final buttontext = find.text("Access");
    expect(buttontext, findsOneWidget);

    await tester.tap(button);
    await tester.pumpAndSettle();
  });
}