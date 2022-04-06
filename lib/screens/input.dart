import 'package:bitcoin_calculator/screens/result.dart';
import 'package:flutter/material.dart';
import 'package:bitcoin_calculator/utils/conversion_tools.dart';

class Input extends StatelessWidget {
  final bool usd_to_btc;
  Input(this.usd_to_btc, {Key key}) : super(key: key);

  final money = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: money,
          ),
          ElevatedButton(
              onPressed: () {
                double result;
                if (usd_to_btc == true) {
                  result = ConversionTools.usd_to_btc(money.text);
                } else {
                  result = ConversionTools.btc_to_usd(money.text);
                }
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => Result(result, usd_to_btc))));
              },
              child: Text('Continue'))
        ],
      )),
    );
  }
}
