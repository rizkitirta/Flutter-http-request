import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_http_request/models/http_provider.dart';
import 'package:provider/provider.dart';

class HomeProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dataProv = Provider.of<HttpProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("UPDATE - PROVIDER"),
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
                child: Consumer<HttpProvider>(
              builder: (context, value, child) => Text(
                (value.data["name"] == null)
                    ? " Belum ada data"
                    : value.data["name"],
                style: TextStyle(fontSize: 20),
              ),
            )),
            SizedBox(height: 20),
            FittedBox(child: Text("Email : ", style: TextStyle(fontSize: 20))),
            FittedBox(
                child: Consumer<HttpProvider>(
              builder: (context, value, child) => Text(
                (value.data["email"] == null)
                    ? "Belum ada data"
                    : "${value.data["email"]}",
                style: TextStyle(fontSize: 20),
              ),
            )),
            SizedBox(height: 20),
            SizedBox(height: 100),
            OutlinedButton(
              onPressed: () {
                return dataProv.connectApi("1", "Fadil", "tirta@mail.com");
              },
              child: Text(
                "POST DATA",
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
