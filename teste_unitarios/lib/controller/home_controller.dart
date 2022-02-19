import '../repository/home_repository.dart';

abstract class IHomeController {
  Future<int> get currentIndex;
  Future<void> setCurrentIndex(int newIndex);
}

class HomeController implements IHomeController {
  final IHomeRepository _repository;

  HomeController(this._repository);

  @override
  Future<int> get currentIndex async => await _repository.readCurrentIndex();

  @override
  Future<void> setCurrentIndex(int newIndex) async {
    await _repository.saveCurrentIndex(newIndex);
  }
}
