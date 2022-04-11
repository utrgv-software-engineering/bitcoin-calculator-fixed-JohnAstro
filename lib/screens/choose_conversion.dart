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
      appBar: AppBar(
        title: Text(
          'Bitcoin Calculator',
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Choose Conversion",
              key: Key('choose-conversion-text'),
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              key: Key('usd-to-btc-button'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25))),
              onPressed: () {
                usd_to_btc = true;
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Input(usd_to_btc)));
              },
              // Icons in USD to BTC button
              child: Ink(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(25)),
                child: Container(
                    height: 50,
                    width: 250,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Icon(
                            Icons.monetization_on_outlined,
                            color: Colors.green,
                            size: 50,
                          ),
                        ),
                        Icon(
                          Icons.arrow_right_alt,
                          color: Colors.black,
                          size: 50,
                        ),
                        Container(
                          padding: EdgeInsets.all(4.0),
                          child: Image(
                              width: 42,
                              color: Colors.amber,
                              image: AssetImage(
                                  "assets/bitcoin-icon-png-42924.png")),
                        ),
                      ],
                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              key: Key('btc-to-usd-button'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25))),
              onPressed: () {
                usd_to_btc = false;
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Input(usd_to_btc)));
              },
              // icons in USD to BTC button
              child: Ink(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(25)),
                child: Container(
                    height: 50,
                    width: 250,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(4.0),
                          child: Image(
                              width: 42,
                              color: Colors.amber,
                              image: AssetImage(
                                  "assets/bitcoin-icon-png-42924.png")),
                        ),
                        Icon(
                          Icons.arrow_right_alt,
                          color: Colors.black,
                          size: 50,
                        ),
                        Icon(
                          Icons.monetization_on_outlined,
                          color: Colors.green,
                          size: 50,
                        ),
                      ],
                    )),
              ),
            ),
          )
        ],
      )),
    );
  }
}
