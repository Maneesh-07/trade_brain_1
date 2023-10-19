import 'package:flutter/material.dart';
import 'package:trade_brain_1/model/sample_stocks/stock_details.dart';
import 'package:trade_brain_1/services/fetch_data.dart';

class SamplePage extends StatefulWidget {
  const SamplePage({super.key});

  @override
  State<SamplePage> createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  List<StockDetails1> everyOneList = [];
  @override
  void initState() {
    getEveryone();
    super.initState();
  }

  Future<void> getEveryone() async {
    everyOneList = await ApihandlerForEveryone.fetchEveryOneMovies();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(right: 2, left: 5),
          color: Colors.white,
          height: MediaQuery.sizeOf(context).height,
          child: ListView.builder(
              itemCount: everyOneList.length,
              itemBuilder: (context, index) => Container(
                    height: 60,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.amber,
                          child: ClipOval(
                            child: Text(
                              everyOneList[index].symbol,
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        Text(
                          everyOneList[index].company,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          everyOneList[index].type,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  )),
        )
      ],
    );
  }
}
