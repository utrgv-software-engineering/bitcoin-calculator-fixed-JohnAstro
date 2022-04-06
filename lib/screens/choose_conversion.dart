import 'package:bitcoin_calculator/screens/input.dart';
import 'package:flutter/material.dart';

class ChooseConversion extends StatefulWidget {
  const ChooseConversion({Key key}) : super(key: key);

  @override
  State<ChooseConversion> createState() => _ChooseConversionState();
}

class _ChooseConversionState extends State<ChooseConversion> {
  bool usd_to_btc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                usd_to_btc = true;
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Input(usd_to_btc)));
              },
              child: Text('USD to BTC')),
          ElevatedButton(
              onPressed: () {
                usd_to_btc = false;
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Input(usd_to_btc)));
              },
              child: Text('BTC to USD'))
        ],
      )),
    );
  }
}
