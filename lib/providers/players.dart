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

  addPlayer(String name, String position, String image) async {
    DateTime datetimeNow = DateTime.now();

    Uri url = Uri.parse(
        "https://flutter-crud-419ce-default-rtdb.firebaseio.com/players.json");

    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            "name": name,
            "position": position,
            "imageUrl": image,
            "createdAt": datetimeNow.toString(),
          },
        ),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
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
      } else {
        throw ("${response.statusCode}");
      }
    } catch (error) {
      return throw (error);
    }
  }

  editPlayer(String id, String name, String position, String image) async {
    Uri url = Uri.parse(
        "https://flutter-crud-419ce-default-rtdb.firebaseio.com/players$id.json");

    try {
      final response = await http.patch(
        url,
        body: json.encode(
          {
            "name": name,
            "position": position,
            "imageUrl": image,
          },
        ),
      );

      if (response != null) {
        Player selectPlayer =
            _allPlayer.firstWhere((element) => element.id == id);
        selectPlayer.name = name;
        selectPlayer.position = position;
        selectPlayer.imageUrl = image;
        notifyListeners();
      } else {
        throw (response.statusCode);
      }
    } catch (err) {
      return throw (err);
    }
  }

  deletePlayer(String id) async {
    Uri url = Uri.parse(
        "https://flutter-crud-419ce-default-rtdb.firebaseio.com/players/$id.json");

    try {
      final response = await http.delete(url).then(
        (response) {
          _allPlayer.removeWhere((element) => element.id == id);
          notifyListeners();
        },
      );

      if (response.statusCoode) {
        throw (response.statusCode);
      }
    } catch (e) {
      throw (e);
    }
  }

  Future<void> initialData() async {
    Uri url = Uri.parse(
        "https://flutter-crud-419ce-default-rtdb.firebaseio.com/players.json");

    var hasilGetData = await http.get(url);

    var dataResponse = json.decode(hasilGetData.body) as Map<String, dynamic>;
    print(dataResponse);

    if (dataResponse != null) {
      dataResponse.forEach(
        (key, value) {
          print(value["craeatedAt"]);
          DateTime dateTimeParse =
              DateFormat("yyyy-mm-dd hh:mm:ss").parse(value["createdAt"]);

          _allPlayer.add(
            Player(
              id: key,
              createdAt: dateTimeParse,
              imageUrl: value["imageUrl"],
              name: value["name"],
              position: value["position"],
            ),
          );
        },
      );
      print("BERHASIL MASUKAN DATA LIST");

      notifyListeners();
    }
  }
  // Future<void> deletePlayer(String id){
  //   Uri uri = Uri.parse("https://flutter-crud-419ce-default-rtdb.firebaseio.com/players/$id.json");

  //   return http.delete(uri).then((res){
  //     _allPlayer.removeWhere((element) => element.id == id);
  //   });
  // }
}
