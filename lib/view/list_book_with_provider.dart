import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/model/getList_book.dart';
import 'package:provider_example/provider/counter_provider.dart';

class ListBookWithProvider extends StatefulWidget {
  ListBookWithProvider({Key? key}) : super(key: key);

  @override
  State<ListBookWithProvider> createState() => _ListBookWithProviderState();
}

class _ListBookWithProviderState extends State<ListBookWithProvider> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final listbook = Provider.of<CounterProvider>(context, listen: false);
    listbook.getlistdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("List Book With Provider"),
      ),
      body: Consumer<CounterProvider>(
        builder: (context, value, child) {
          return Container(
            padding: EdgeInsets.all(16),
            child: ListView(
              children: List.generate(
                value.listbook!.books!.length,
                (index) => Row(
                  children: [
                    Image.network(
                      value.listbook!.books![index].image!,
                      height: 200,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(value.listbook!.books![index].title!),
                          Text(
                            value.listbook!.books![index].subtitle!,
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
