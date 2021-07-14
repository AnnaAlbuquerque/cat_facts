import 'dart:convert';

import 'package:cat_facts/src/core/Fact.dart';
import 'package:http/http.dart' as http;

class HomeRepository {
  Future<Fact> getFacts() async {
    final baseURL = "https://catfact.ninja";
    var url = Uri.parse(
      '$baseURL/fact?max_length=140',
    );
    final response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      print(json['fact']);

      return Fact(fact: json['fact']);
    } else {
      return Fact(fact: "");
    }
  }
}
