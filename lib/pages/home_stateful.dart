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
        title: Text("UPDATE - STATEFUL"),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            FittedBox(child: Text("Name : ", style: TextStyle(fontSize: 20))),
            FittedBox(
              child: Text(
                (dataResponse.name == null)
                    ? "Belum ada name"
                    : "${dataResponse.name}",
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
                HttpStateFul.connectApi("2", "Rizki", "rizki@mail.com")
                    .then((value) {
                  setState(() {
                    dataResponse = value;
                  });
                });
              },
              child: Text(
                "UPDATE DATA",
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
