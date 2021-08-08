import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpStateful {
  String id, name, job, createdAt;

  HttpStateful({this.id, this.name, this.job, this.createdAt});

  static Future<HttpStateful> connectApi(String name, String job) async {
    Uri urlUser = Uri.parse("https://reqres.in/api/users");

    var hasilResponse =
        await http.post(urlUser, body: {"name": name, "job": job});

    var data = jsonDecode(hasilResponse.body);

    return HttpStateful(
        id: data["id"],
        name: data["name"],
        job: data["job"],
        createdAt: data["createdAt"]);
  }
}
