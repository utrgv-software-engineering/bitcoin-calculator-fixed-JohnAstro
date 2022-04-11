import 'package:flutter/material.dart';
import 'choose_conversion.dart';

class Result extends StatefulWidget {
  final String input;
  final double result;
  final bool usdToBtc;
  const Result(this.input, this.result, this.usdToBtc, {Key key})
      : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Bitcoin Calculator'),
          centerTitle: true,
          leading: IconButton(
              key: Key('back-button2'),
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_ios)),
          backgroundColor: Colors.blueGrey,
          foregroundColor: Colors.white,
        ),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: 100,
                width: 300,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey, width: 2),
                    borderRadius: BorderRadius.circular(15)),
                child: widget.usdToBtc
                    ? Text(
                        "${widget.input} USD is equal to ${widget.result} BTC")
                    : Text(
                        "${widget.input} BTC is equal to ${widget.result} USD")),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              width: 200,
              child: ElevatedButton(
                  key: Key('done-button'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey,
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChooseConversion()));
                  },
                  child: Text('Done')),
            ),
          )
        ])));
  }
}
