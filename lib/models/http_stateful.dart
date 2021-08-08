import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpStateFul {
  String id, name, email;

  HttpStateFul({this.id, this.name, this.email});

  static Future<HttpStateFul> connectApi(
      String id, String name, String email) async {
    Uri url = Uri.parse("https://reqres.in/api/users/" + id);

    var hasilResponse =
        await http.put(url, body: {"name": name, "email": email});
    var data = (jsonDecode(hasilResponse.body));

    return HttpStateFul(name: data["name"], email: data["email"]);
  }
}
