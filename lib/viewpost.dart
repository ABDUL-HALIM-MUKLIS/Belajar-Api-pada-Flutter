import 'package:belajar_api/model/post_api.dart';
import 'package:flutter/material.dart';

class apipost extends StatefulWidget {
  const apipost({Key? key}) : super(key: key);

  @override
  _apipostState createState() => _apipostState();
}

class _apipostState extends State<apipost> {
  PostResult? postResult; //membuat object dan berisi null
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      appBar: AppBar(
        title: Text("Belajar POST"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text((postResult != null)
                ? postResult!.id +
                    "|" +
                    postResult!.name +
                    "|" +
                    postResult!.job +
                    "|" +
                    postResult!.created
                : "Tidak ada Data"),
            ElevatedButton(
              style: style,
              onPressed: () {
                PostResult.connectToAPI("Halim", "Pogramer").then((value) {
                  postResult = value;
                  setState(() {}); //untuk meng update tampilan
                });
              },
              child: const Text('POST'),
            ),
          ],
        ),
      ),
    );
  }
}
