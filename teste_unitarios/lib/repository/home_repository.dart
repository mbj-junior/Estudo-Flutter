import 'package:shared_preferences/shared_preferences.dart';

abstract class IHomeRepository {
  Future<void> saveCurrentIndex(int currentIndex);
  Future<int> readCurrentIndex();
}

class HomeRepository implements IHomeRepository {
  final currentIndexKey = 'currenIndex';
  @override
  Future<int> readCurrentIndex() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(currentIndexKey) ?? 0;
  }

  @override
  Future<void> saveCurrentIndex(int currentIndex) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(currentIndexKey, currentIndex);
  }
}
