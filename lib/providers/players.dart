import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../models/player.dart';

class Players with ChangeNotifier {
  List<Player> _allPlayer = [];

  List<Player> get allPlayer => _allPlayer;

  int get jumlahPlayer => _allPlayer.length;

  Player selectById(String id) =>
      _allPlayer.firstWhere((element) => element.id == id);

  Future<void> addPlayer(String name, String position, String image) {
    DateTime datetimeNow = DateTime.now();

    Uri url = Uri.parse(
        "https://flutter-crud-419ce-default-rtdb.firebaseio.com/players.json");

    return http
        .post(
      url,
      body: json.encode(
        {
          "name": name,
          "position": position,
          "imageUrl": image,
          "createdAt": datetimeNow.toString(),
        },
      ),
    )
        .then(
      (response) {
        print("THEN FUNCTION");
        _allPlayer.add(
          Player(
            id: json.decode(response.body)["name"].toString(),
            name: name,
            position: position,
            imageUrl: image,
            createdAt: datetimeNow,
          ),
        );

        notifyListeners();
      },
    );
  }

  void editPlayer(String id, String name, String position, String image,
      BuildContext context) {
    Player selectPlayer = _allPlayer.firstWhere((element) => element.id == id);
    selectPlayer.name = name;
    selectPlayer.position = position;
    selectPlayer.imageUrl = image;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Berhasil diubah"),
        duration: Duration(seconds: 2),
      ),
    );
    notifyListeners();
  }

  void deletePlayer(String id, BuildContext context) {
    _allPlayer.removeWhere((element) => element.id == id);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Berhasil dihapus"),
        duration: Duration(milliseconds: 500),
      ),
    );
    notifyListeners();
  }

  //Get data
  Future<void> initialData() async {
    Uri url = Uri.parse(
        "https://flutter-crud-419ce-default-rtdb.firebaseio.com/players.json");

    var hasilGetData = await http.get(url);

    var dataResponse = jsonDecode(hasilGetData.body) as Map<String, dynamic>;

    dataResponse.forEach((key, value) {
      DateTime createdAt =
          DateFormat("yyyy-mm-dd hh:mm:ss").parse(value["createdAt"]);
      //print(value["name"]);

      _allPlayer.add(Player(
        id: key,
        name: value["name"],
        position: value["position"],
        createdAt: createdAt,
      ));
    });

    notifyListeners();
  }
}
