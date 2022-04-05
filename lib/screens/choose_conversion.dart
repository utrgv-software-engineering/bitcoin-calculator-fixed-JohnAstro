import 'package:flutter/material.dart';

class ChooseConversion extends StatefulWidget {
  const ChooseConversion({Key key}) : super(key: key);

  @override
  State<ChooseConversion> createState() => _ChooseConversionState();
}

class _ChooseConversionState extends State<ChooseConversion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          ElevatedButton(onPressed: () {}, child: Text('USD to BTC')),
          ElevatedButton(onPressed: () {}, child: Text('BTC to USD'))
        ],
      )),
    );
  }
}
