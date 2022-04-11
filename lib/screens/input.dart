import 'package:bitcoin_calculator/screens/result.dart';
import 'package:flutter/material.dart';
import 'package:bitcoin_calculator/utils/conversion_tools.dart';
import 'package:bitcoin_calculator/utils/current_bitcoin_rate.dart';
import 'package:bitcoin_calculator/utils/bitcoin_api.dart';
import 'package:bitcoin_calculator/config/globals.dart';

class Input extends StatefulWidget {
  final bool usdToBtc;
  Input(this.usdToBtc, {Key key}) : super(key: key);

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  final money = TextEditingController();
  bool validate = false;
  double result;
  Future<CurrentBTCInUSD> futureRate;
  double btcRate;

  @override
  void initState() {
    super.initState();
    futureRate = BitcoinAPI.fetchCurrentBTCInUSD(httpClient);
  }

  double currentRateFetch() {
    FutureBuilder<CurrentBTCInUSD>(
        future: futureRate,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text("${snapshot.data.rateFloat}");
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bitcoin Calculator',
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
        leading: IconButton(
            key: Key('back-button1'),
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios)),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder<CurrentBTCInUSD>(
              future: futureRate,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  btcRate = snapshot.data.rateFloat;

                  return Text(
                    "${snapshot.data.rateFloat}",
                    style: TextStyle(color: Colors.transparent),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const Text(
                  'Loading BTC Rate',
                  style: TextStyle(color: Colors.transparent),
                );
              }),
          widget.usdToBtc
              ? Text(
                  "Enter USD to convert to BTC",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                )
              : Text("Enter BTC to convert to USD",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
            child: TextField(
              key: Key('input-text-field'),
              controller: money,
              decoration: InputDecoration(
                  labelText: "Enter Value",
                  labelStyle: TextStyle(
                      color: validate ? Colors.red[700] : Colors.blueGrey),
                  errorText: validate ? "Invalid Input" : null,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.blueGrey, width: 3)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.blueGrey, width: 2)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.blueGrey))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                key: Key('continue-button'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey,
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25))),
                onPressed: () {
                  setState(() {
                    validate = ConversionTools.checkInvalidInput(money.text);
                    if (!validate) {
                      if (widget.usdToBtc) {
                        double currentRate = currentRateFetch();
                        result =
                            ConversionTools.usd_to_btc(money.text, btcRate);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Result(
                                    money.text, result, widget.usdToBtc)));
                      } else {
                        double currentRate = currentRateFetch();
                        result =
                            ConversionTools.btc_to_usd(money.text, btcRate);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Result(
                                    money.text, result, widget.usdToBtc)));
                      }
                    }
                  });
                },
                child: Ink(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(25)),
                    child: Container(
                        height: 50,
                        width: 200,
                        alignment: Alignment.center,
                        child: Text(
                          "Continue",
                          style: TextStyle(fontSize: 16),
                        )))),
          )
        ],
      )),
    );
  }
}
