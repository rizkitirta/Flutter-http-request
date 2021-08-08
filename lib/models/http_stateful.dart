import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpStateFul {
  String id, fullname, email, avatar;

  HttpStateFul({this.id, this.fullname, this.email, this.avatar});

  static Future<HttpStateFul> connectApi(String id) async {
    Uri url = Uri.parse("https://reqres.in/api/users/" + id);

    var hasilResponse = await http.get(url);
    var data = (jsonDecode(hasilResponse.body))["data"];

    return HttpStateFul(
        id: data["id"].toString(),
        fullname: data["first_name"],
        email: data["email"],
        avatar: data["avatar"]);
    //print(data);
  }
}
