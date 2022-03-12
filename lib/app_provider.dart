import 'package:flutter/cupertino.dart';
import 'package:listview_builder/model.dart';
import 'package:listview_builder/repository.dart';

class Counter with ChangeNotifier {
  Repository repository;
  int _page = 0;
  bool _loading = false;
  List<Character> characters = [];

  Counter(this.repository) {
    getData();
  }

  int get page => _page;
  bool get loading => _loading;

  Future<void> getData() async {
    print('hi');
    try {
      _loading = true;
      notifyListeners();

      final response = await repository.getItems(page);
      _page = _page + 10;

      if (response.isEmpty) {
        _page = 0;
        getData();
      }
      characters = response;
      _loading = false;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
