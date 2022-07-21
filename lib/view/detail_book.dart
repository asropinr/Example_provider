import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/provider/counter_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DetailBookPage extends StatefulWidget {
  final String? noIs;
  final String? title;
  DetailBookPage({
    Key? key,
    @required this.noIs,
    @required this.title,
  }) : super(key: key);

  @override
  State<DetailBookPage> createState() => _DetailBookPageState();
}

class _DetailBookPageState extends State<DetailBookPage> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<CounterProvider>(context, listen: false)
        .getDetailBook(widget.noIs!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            return Column(
              children: [
                Row(
                  children: [
                    Image.network(
                      value.detailBook!.image!,
                      scale: 1.5,
                    ),
                    // Container(
                    //   width: 150,
                    //   height: 150,
                    //   decoration: BoxDecoration(
                    //       image: DecorationImage(
                    //           image: NetworkImage(value.detailBook!.image!))),
                    // ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              value.detailBook!.title!,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              value.detailBook!.publisher!,
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Text(
                              "Author : ${value.detailBook!.authors!}",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "${value.detailBook!.language!} - ${value.detailBook!.rating!} stars ",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              value.detailBook?.subtitle ?? "No Subtittle",
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
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () async {
                        launchUrlString(value.detailBook!.url!);
                      },
                      child: Text(
                        "BUY",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    children: [
                      Text(
                        "Deskripsi",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        value.detailBook!.desc!,
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
