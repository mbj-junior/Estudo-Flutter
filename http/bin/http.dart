import 'dart:convert';

import 'package:http/http.dart' as http;

Future main() async {
  final json = await fetch();
  print(json);
  print(json['id']);
}

Future<Map> fetch() async {
  var url = 'https://jsonplaceholder.typicode.com/todos/1';
  var response = await http.get(Uri.parse(url));
  print(response.body);
  var json = jsonDecode(response.body);
  return json;
}
