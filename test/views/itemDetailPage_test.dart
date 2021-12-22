import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:menu/model/item.dart';
import 'package:menu/views/itemDetailPage.dart';

void main() {
  testWidgets('itemDetailPage testing based if the text is observed in the widget', (tester) async {
    final String text = "Testing title over image";
    await tester.pumpWidget(
      MaterialApp(
      home: ItemDetailPage(new Item(text,"https://images.unsplash.com/photo-1622267224551-8063a2d4fbb4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80")))
    );
    final titleFinder = find.text(text);
    expect(titleFinder, findsOneWidget);
  });
}