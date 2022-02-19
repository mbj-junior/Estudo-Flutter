import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_unitarios/view/home_page.dart';

void main() {
  testWidgets('Should validade basic widgets', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: HomePage(),
    ));

    final title = find.text('Website Update');
    expect(title, findsOneWidget);
  });
}
