import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_http_request/models/http_stateful.dart';

class HomeStateful extends StatefulWidget {
  @override
  _HomeStatefulState createState() => _HomeStatefulState();
}

class _HomeStatefulState extends State<HomeStateful> {
  HttpStateFul dataResponse = HttpStateFul();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GET - STATEFUL"),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                child: Image.network((dataResponse.avatar == null)
                    ? "https://reqres.in/img/faces/2-image.jpg"
                    : dataResponse.avatar),
                height: 100,
                width: 100,
              ),
            ),
            SizedBox(height: 20),
            FittedBox(
              child: Text(
                (dataResponse.id == null)
                    ? "ID : Belum ada id"
                    : "ID : ${dataResponse.id}",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 20),
            FittedBox(child: Text("Name : ", style: TextStyle(fontSize: 20))),
            FittedBox(
              child: Text(
                (dataResponse.fullname == null)
                    ? "Belum ada name"
                    : "${dataResponse.fullname}",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 20),
            FittedBox(child: Text("Email : ", style: TextStyle(fontSize: 20))),
            FittedBox(
              child: Text(
                (dataResponse.email == null)
                    ? "Belum ada email"
                    : "${dataResponse.email}",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(height: 100),
            OutlinedButton(
              onPressed: () {
                HttpStateFul.connectApi((1+Random().nextInt(10)).toString()).then((value) {
                  setState(() {
                    dataResponse = value;
                  });
                });
              },
              child: Text(
                "GET DATA",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
