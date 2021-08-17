import 'package:belajar_api/model/get_api.dart';
import 'package:flutter/material.dart';

class apigetkumpulandata extends StatefulWidget {
  const apigetkumpulandata({Key? key}) : super(key: key);

  @override
  _apigetkumpulandataState createState() => _apigetkumpulandataState();
}

class _apigetkumpulandataState extends State<apigetkumpulandata> {
  User? user;
  String output = "Tidak ada Data";
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
            Text(output),
            ElevatedButton(
              style: style,
              onPressed: () {
                User.getUsers("2").then((users) {
                  output = "";
                  for (int i = 0; i < users.length; i++) {
                    output = output + "[" + users[i].name.toString() + "]";
                  }
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
