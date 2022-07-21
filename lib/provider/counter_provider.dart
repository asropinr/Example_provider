import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider_example/model/getDetail_book.dart';
import 'package:provider_example/model/getList_book.dart';
import 'package:http/http.dart' as http;

class CounterProvider extends ChangeNotifier {
  int counter = 0;

  void incrementCounter() {
    counter++;
    notifyListeners();
  }

  GetListBook? listbook;
  getlistdata() async {
    var url = Uri.parse('https://api.itbook.store/1.0/new');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    //print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      listbook = GetListBook.fromJson(json);
    }
    notifyListeners();
  }

  GetDetailBook? detailBook;
  getDetailBook(String isbn13) async {
    detailBook = null;
    var url = Uri.parse("https://api.itbook.store/1.0/books/${isbn13}");
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      detailBook = GetDetailBook.fromJson(json);
    }
    notifyListeners();
  }
}
