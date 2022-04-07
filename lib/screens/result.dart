import 'package:flutter/material.dart';
import 'choose_conversion.dart';

class Result extends StatefulWidget {
  final double result;
  final bool usd_to_btc;
  const Result(this.result, this.usd_to_btc, {Key key}) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('Conversion: ${widget.result}'),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChooseConversion()));
              },
              child: Text('Done'))
        ])));
  }
}
