import 'package:belajar_api/model/get_api.dart';
import 'package:flutter/material.dart';

class apiget extends StatefulWidget {
  const apiget({Key? key}) : super(key: key);

  @override
  _apigetState createState() => _apigetState();
}

class _apigetState extends State<apiget> {
  User? user;
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      appBar: AppBar(
        title: Text("Belajar GET"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text((user != null)
                ? user!.id! + "|" + user!.name!
                : "Tidak ada Data"),
            ElevatedButton(
              style: style,
              onPressed: () {
                User.connectToAPI("2").then((value) {
                  user = value;
                  setState(() {}); //untuk meng update tampilan
                });
              },
              child: const Text('GET'),
            ),
          ],
        ),
      ),
    );
  }
}
