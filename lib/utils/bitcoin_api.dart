import 'package:bitcoin_calculator/utils/current_bitcoin_rate.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BitcoinAPI {
  static Future<double> fetchCurrentBTCInUSD(http.Client client) async {
    var url =
        Uri.parse('https://api.coindesk.com/v1/bpi/currentprice/usd.json');
    final response = await client.get(url);
    Map<String, dynamic> json = jsonDecode(response.body);

    CurrentBTCInUSD currentRate =
        CurrentBTCInUSD(rateFloat: json['bpi']['USD']['rate_float']);

    if (response.statusCode == 200) {
      return currentRate.rateFloat;
    } else {
      throw Exception('Failed to load current price of BTC in USD');
    }
  }
}
