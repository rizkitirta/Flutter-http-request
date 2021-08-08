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
        title: Text("GET - PROVIDER"),
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
                child: Consumer<HttpProvider>(
                    builder: (context, value, child) => Image.network(
                        (value.data["avatar"] == null)
                            ? "https://reqres.in/img/faces/2-image.jpg"
                            : value.data["avatar"])),
                height: 100,
                width: 100,
              ),
            ),
            FittedBox(
                child: Consumer<HttpProvider>(
              builder: (context, value, child) => Text(
                (value.data["id"] == null)
                    ? "ID : Belum ada data"
                    : "ID : ${value.data["id"]}",
                style: TextStyle(fontSize: 20),
              ),
            )),
            SizedBox(height: 20),
            FittedBox(child: Text("Name : ", style: TextStyle(fontSize: 20))),
            FittedBox(
                child: Consumer<HttpProvider>(
              builder: (context, value, child) => Text(
                (value.data["first_name"] == null)
                    ? "Name : Belum ada data"
                    : "Name" +
                        value.data["first_name"] +
                        " " +
                        value.data["last_name"],
                style: TextStyle(fontSize: 20),
              ),
            )),
            SizedBox(height: 20),
            FittedBox(child: Text("Email : ", style: TextStyle(fontSize: 20))),
            FittedBox(
                child: Consumer<HttpProvider>(
              builder: (context, value, child) => Text(
                (value.data["email"] == null)
                    ? "Job : Belum ada data"
                    : "Job : ${value.data["email"]}",
                style: TextStyle(fontSize: 20),
              ),
            )),
            SizedBox(height: 20),
            SizedBox(height: 100),
            OutlinedButton(
              onPressed: () {
                return dataProv
                    .connectApi((1 + Random().nextInt(20)).toString());
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
