import 'package:flutter/material.dart';

class IncController extends ChangeNotifier {
  int _number = 0;

  int get number => _number;

  incNumber() {
    _number = _number + 1;
    notifyListeners();
  }
}
