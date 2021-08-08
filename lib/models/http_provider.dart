import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'dart:convert';

class HttpProvider with ChangeNotifier {
  Map<String, dynamic> _data = {};

  Map<String, dynamic> get data => _data; //getter
  int get jumlahData => _data.length;

  connectApi(String name, String job) async {
    Uri urlUser = Uri.parse("https://reqres.in/api/users");

    var hasilResponse =
        await http.post(urlUser, body: {"name": name, "job": job});

    _data = jsonDecode(hasilResponse.body);
    notifyListeners();
  }
}
