import 'package:flutter/material.dart';
import 'package:flutter_http_request/models/http_provider.dart';
import 'package:provider/provider.dart';

class HomeProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dataProv = Provider.of<HttpProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("POST - PROVIDER"),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                (value.data["name"] == null)
                    ? "Name : Belum ada data"
                    : "Name : ${value.data["name"]}",
                style: TextStyle(fontSize: 20),
              ),
            )),
            SizedBox(height: 20),
            FittedBox(child: Text("Job : ", style: TextStyle(fontSize: 20))),
            FittedBox(
                child: Consumer<HttpProvider>(
              builder: (context, value, child) => Text(
                (value.data["job"] == null)
                    ? "Job : Belum ada data"
                    : "Job : ${value.data["job"]}",
                style: TextStyle(fontSize: 20),
              ),
            )),
            SizedBox(height: 20),
            FittedBox(
                child: Consumer<HttpProvider>(
              builder: (context, value, child) => Text(
                (value.data["createdAt"] == null)
                    ? "createdAt : Belum ada data"
                    : "createdAt : ${value.data["createdAt"]}",
                style: TextStyle(fontSize: 20),
              ),
            )),
            FittedBox(
              child: Text(
                "Belum ada data",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 100),
            OutlinedButton(
              onPressed: () {
                return dataProv.connectApi("Fadil", "Developer");
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
