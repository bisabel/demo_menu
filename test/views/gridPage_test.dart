import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:menu/views/gridPage.dart';

void main() {
  testWidgets('gridPage: test based if different text is found in the grid component', (tester) async {
    final String text = "StrawBerry milkshake";
    final Key gridkey = Key("GridPage");
    await tester.pumpWidget(
      MaterialApp(
        home: GridPage(key: gridkey)
      )
    );
    var myWidgetState = tester.state(find.byType(GridPage));

    await tester.pumpAndSettle();
    final grid = find.byKey(gridkey);
    expect(grid, findsOneWidget);
   
    final titleFinder = find.text(text);
    expect(titleFinder, findsOneWidget);
  });
}