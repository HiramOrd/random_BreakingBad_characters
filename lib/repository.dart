import 'package:http/http.dart' as http;
import 'package:listview_builder/model.dart';

class Repository {
  static String _baseURL = 'https://www.breakingbadapi.com/api';

  Future<List<Character>> getItems(int index) async {
    try {
      final url = Uri.parse('$_baseURL/characters?limit=10&offset=$index');
      final response = await http.get(url);
      return Character.success(response);
    } catch (e) {
      rethrow;
    }
  }
}
