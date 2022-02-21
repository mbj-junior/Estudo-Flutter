import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_unitarios/controller/home_controller.dart';
import 'package:teste_unitarios/repository/home_repository.dart';

class HomeRepositoryMock extends Mock implements IHomeRepository {}


void main() {
  late IHomeController controller;
  late IHomeRepository repository;

  setUp(() async {
    repository = HomeRepositoryMock();
    controller = HomeController(repository);
  });

  testWidgets('Should validade controller methods', (tester) async {
    when(repository.readCurrentIndex()).thenAnswer((_) => Future.value(0));
    expect(await controller.currentIndex, 0);
    verify(repository.readCurrentIndex()).called(1);
  });
}
