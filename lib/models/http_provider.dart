import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HttpProvider with ChangeNotifier {
  Map<String, dynamic> _data = {};

  Map<String, dynamic> get data => _data;

  int get jumlahData => _data.length;
  Uri url;

  void connectAPI(String id, BuildContext context) async {
    url = Uri.parse("https://reqres.in/api/users/" + id);

    var hasilResponse = await http.get(url);
    print(hasilResponse);

    if (hasilResponse.statusCode == 200) {
      _data = (json.decode(hasilResponse.body))["data"];
      notifyListeners();
      notifSuccess(context, "Data berhasil diambil");
    } else {
      notifSuccess(context, "Data gagal diambil");
    }
  }

  void deleteData(BuildContext context) async {
    var hasilResponse = await http.delete(url);

    if (hasilResponse.statusCode == 204) {
      _data = {};
      notifyListeners();
      notifSuccess(context, "Data gagal dihapus");
    }
  }

  notifSuccess(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 1),
    ));
  }
}
