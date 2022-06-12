import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/listbook");
                },
                child: Text("List Book Without Provider")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/listbookprov");
                },
                child: Text("List Book With Provider"))
          ],
        ),
      ),
    );
  }
}
