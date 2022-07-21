import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider_example/model/getList_book.dart';

class ListBookPage extends StatefulWidget {
  ListBookPage({Key? key}) : super(key: key);

  @override
  State<ListBookPage> createState() => _ListBookPageState();
}

class _ListBookPageState extends State<ListBookPage> {
  //podo access with map or parsejson
  Map<String, dynamic>? responListBook;
  getData() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/albums/1');
    // //contoh penggunaan dengan autentikasi
    // // final Map<String, String> header = {
    // //   /*list autentikasi saat akan melakukan request desusiakan dengan
    // //   permintaan dari server*/
    // //   "userName": "",
    // //   "password": "",
    // // };
    // // var response = await http.get(url, headers: header);
    var response = await http.get(
      url,
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      responListBook = jsonDecode(response.body);
      setState(() {});
    }

//print(await http.read(Uri.parse('https://example.com/foobar.txt')));
  }

//using model and using json to object
  List<Widget> listBooks = [];
  GetListBook? dataBooks;
  getDataListBook() async {
    var url = Uri.parse('https://api.itbook.store/1.0/new');
    var response = await http.get(
      url,
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      dataBooks = GetListBook.fromJson(json);
      dataBooks!.books!.forEach((item) {
        final widget = Row(
          children: [
            Image.network(
              item.image!,
              height: 200,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title!,
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    item.subtitle!,
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            )
          ],
        );
        listBooks.add(widget);
      });
      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    getDataListBook();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Book"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(responListBook == null ? "data" : responListBook!["title"]),
            ...listBooks,
          ],
        ),
      ),
    );
  }
}
