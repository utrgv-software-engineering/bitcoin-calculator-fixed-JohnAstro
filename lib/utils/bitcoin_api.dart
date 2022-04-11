import 'package:bitcoin_calculator/utils/current_bitcoin_rate.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BitcoinAPI {
  static Future<CurrentBTCInUSD> fetchCurrentBTCInUSD(
      http.Client client) async {
    var url =
        Uri.parse('https://api.coindesk.com/v1/bpi/currentprice/usd.json');
    final response = await client.get(url);

    if (response.statusCode == 200) {
      return CurrentBTCInUSD.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load current price of BTC in USD');
    }
  }
}
