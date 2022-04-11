import 'package:bitcoin_calculator/utils/current_bitcoin_rate.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BitcoinAPI {
  static Future<double> fetchCurrentBTCInUSD(http.Client client) async {
    var url =
        Uri.parse('https://api.coindesk.com/v1/bpi/currentprice/usd.json');

    // Get response from client given url
    final response = await client.get(url);

    // Decode jason response from api to a Map<String, dynamic> variable
    Map<String, dynamic> json = jsonDecode(response.body);

    // If HTTP status code 200 (i.e., successful) return the rate
    if (response.statusCode == 200) {
      return CurrentBTCInUSD.fromJson(json).rateFloat;
    } else {
      throw Exception('Failed to load current price of BTC in USD');
    }
  }
}
