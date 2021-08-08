import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'dart:convert';

class HttpProvider with ChangeNotifier {
  Map<String, dynamic> _data = {};
  Map<String, dynamic> get data => _data;

  int get jumlahData => _data.length;

  void connectApi(String id, String name, String email) async {
    Uri url = Uri.parse("https://reqres.in/api/users/" + id);

    var hasilResponse =
        await http.put(url, body: {"name": name, "email": email});
    _data = (jsonDecode(hasilResponse.body));

    notifyListeners();
  }
}
