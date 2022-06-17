import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/provider/counter_provider.dart';

class DetailBookPage extends StatefulWidget {
  final String? title;
  final String? noIs;
  DetailBookPage({
    Key? key,
    @required this.title,
    @required this.noIs,
  }) : super(key: key);

  @override
  State<DetailBookPage> createState() => _DetailBookPageState();
}

class _DetailBookPageState extends State<DetailBookPage> {
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final detailBook = Provider.of<CounterProvider>(context, listen: false);
    detailBook.getDetailBook(widget.noIs!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text(widget.title!),
          centerTitle: true,
        ),
        body: Consumer<CounterProvider>(
          builder: (context, value, child) {
            if (value.detailBook == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Image.network(
                            value.detailBook!.image!,
                            height: 200,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  value.detailBook!.title!,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  value.detailBook!.publisher!,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  value.detailBook!.title!,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  value.detailBook!.subtitle!,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  value.detailBook!.price!,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            onPressed: () async {},
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blue[900]),
                            child: Text("BUY"),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          value.detailBook!.desc!,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            height: 1.5,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
            }
          },
        ));
  }
}
