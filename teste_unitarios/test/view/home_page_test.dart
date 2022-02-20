import 'package:mockito/mockito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_unitarios/view/home_page.dart';
import 'package:teste_unitarios/controller/home_controller.dart';

class HomeControllerMock extends Mock implements IHomeController {}

void main() {
  late IHomeController controller;
  setUp(() async {
    controller = HomeControllerMock();
    when(controller.currentIndex).thenAnswer((_) => Future.value(0));
    when(controller.setCurrentIndex(0))
        .thenAnswer((realInvocation) => Future.value());
  });

  testWidgets('Should validade basic widgets', (tester) async {
    await tester
        .pumpWidget(MaterialApp(home: HomePage(controller: controller)));

    final title = find.text('Website Update');
    expect(title, findsOneWidget);

    final appBar = find.byType(AppBar);
    expect(appBar, findsOneWidget);

    final appBarWidget = tester.widget<AppBar>(appBar);
    expect(appBarWidget.actions?.length, 2);

    final listViewCopy = find.byKey(const Key('list-view-copy'));
    expect(listViewCopy, findsOneWidget);

    final bottomNavigationBar = find.byType(BottomNavigationBar);
    expect(bottomNavigationBar, findsOneWidget);
  });

  testWidgets('Should controller', (tester) async {
    await tester
        .pumpWidget(MaterialApp(home: HomePage(controller: controller)));

    final bottomNavigationBar = find.byType(BottomNavigationBar);
    final bottomWidget =
        tester.widget<BottomNavigationBar>(bottomNavigationBar);

    expect(bottomWidget.currentIndex, 0);

    final item2 = find.text('Item 2');
    expect(item2, findsOneWidget);

    await tester.tap(item2);
    await tester.pump();

    verify(controller.setCurrentIndex(1)).called(1);
  });
}
