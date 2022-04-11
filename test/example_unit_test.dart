import 'package:bitcoin_calculator/utils/conversion_tools.dart';
import 'package:bitcoin_calculator/utils/current_bitcoin_rate.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:bitcoin_calculator/utils/bitcoin_api.dart';

// Create a MockClient using the Mock class provided by the Mockito package.
// Create new instances of this class in each test.
class MockClient extends Mock implements http.Client {}

void main() {
  final client = MockClient();
  final fakeBitcoinAPIData =
      '{"time": {"updated": "Nov 5, 2020 19:01:00 UTC", "updatedISO": "2020-11-05T19:01:00+00:00", "updateduk": "Nov 5, 2020 at 19:01 GMT"}, "disclaimer": "This data was produced from the CoinDesk Bitcoin Price Index (USD). Non-USD currency data converted using hourly conversion rate from openexchangerates.org", "bpi": { "USD": { "code": "USD", "rate": "14,934.5833", "description": "United States Dollar", "rate_float": 14934.5833}}}';
  var url = Uri.parse('https://api.coindesk.com/v1/bpi/currentprice/usd.json');

  // Use Mockito to return a successful response when it calls the
  // provided http.Client.
  when(client.get(url))
      .thenAnswer((_) async => http.Response(fakeBitcoinAPIData, 200));
  group("Happy path", () {
    test("usd_to_btc should return proper calculation", () async {
      double btcRate = await BitcoinAPI.fetchCurrentBTCInUSD(client);

      expect(btcRate, isA<double>());

      expect(btcRate, 14934.5833);

      var testConversion = ConversionTools.usd_to_btc('14934.5833', btcRate);
      expect(testConversion, 1.0);
    });

    test("btc_to_usd should return proper calculation", () async {
      double btcRate = await BitcoinAPI.fetchCurrentBTCInUSD(client);

      expect(btcRate, isA<double>());

      expect(btcRate, 14934.5833);
      var testConversion = ConversionTools.btc_to_usd('1', btcRate);
      expect(testConversion, 14934.5833);
    });

    test(
        "btc_to_usd should return proper calculation with decimal input without leading digit",
        () async {
      double btcRate = await BitcoinAPI.fetchCurrentBTCInUSD(client);

      expect(btcRate, isA<double>());

      expect(btcRate, 14934.5833);
      var testConversion = ConversionTools.btc_to_usd('.1', btcRate);
      expect(testConversion, 1493.4583300000002);
    });
  });

  group("Sad path", () {
    group("usd_to_btc", () {
      test("should return ArgumentError on empty string", () async {
        double btcRate = await BitcoinAPI.fetchCurrentBTCInUSD(client);

        expect(btcRate, isA<double>());

        expect(btcRate, 14934.5833);
        expect(
            () => ConversionTools.usd_to_btc('', btcRate), throwsArgumentError);
      });
      test("should return ArgumentError on string with a space", () async {
        double btcRate = await BitcoinAPI.fetchCurrentBTCInUSD(client);

        expect(btcRate, isA<double>());

        expect(btcRate, 14934.5833);
        expect(() => ConversionTools.usd_to_btc(' ', btcRate),
            throwsArgumentError);
      });
      test("should return ArgumentError on string with a '-'", () async {
        double btcRate = await BitcoinAPI.fetchCurrentBTCInUSD(client);

        expect(btcRate, isA<double>());

        expect(btcRate, 14934.5833);

        expect(() => ConversionTools.usd_to_btc('-', btcRate),
            throwsArgumentError);
      });
      test("should return ArgumentError on string with invalid characters",
          () async {
        double btcRate = await BitcoinAPI.fetchCurrentBTCInUSD(client);

        expect(btcRate, isA<double>());

        expect(btcRate, 14934.5833);

        expect(() => ConversionTools.usd_to_btc('%^vtjh,', btcRate),
            throwsArgumentError);
      });

      test("should return ArgumentError on string with two decimals", () async {
        double btcRate = await BitcoinAPI.fetchCurrentBTCInUSD(client);

        expect(btcRate, isA<double>());

        expect(btcRate, 14934.5833);

        expect(() => ConversionTools.usd_to_btc('0.012.0', btcRate),
            throwsArgumentError);
      });
    });

    group("btc_to_usd", () {
      test("should return ArgumentError on empty string", () async {
        double btcRate = await BitcoinAPI.fetchCurrentBTCInUSD(client);

        expect(btcRate, isA<double>());

        expect(btcRate, 14934.5833);

        expect(
            () => ConversionTools.btc_to_usd('', btcRate), throwsArgumentError);
      });
      test("should return ArgumentError on string with a space", () async {
        double btcRate = await BitcoinAPI.fetchCurrentBTCInUSD(client);

        expect(btcRate, isA<double>());

        expect(btcRate, 14934.5833);

        expect(() => ConversionTools.btc_to_usd(' ', btcRate),
            throwsArgumentError);
      });
      test("should return ArgumentError on string with a '-'", () async {
        double btcRate = await BitcoinAPI.fetchCurrentBTCInUSD(client);

        expect(btcRate, isA<double>());

        expect(btcRate, 14934.5833);

        expect(() => ConversionTools.btc_to_usd('-', btcRate),
            throwsArgumentError);
      });
      test("should return ArgumentError on string with invalid characters",
          () async {
        double btcRate = await BitcoinAPI.fetchCurrentBTCInUSD(client);

        expect(btcRate, isA<double>());

        expect(btcRate, 14934.5833);

        expect(() => ConversionTools.btc_to_usd('%^vtjh,', btcRate),
            throwsArgumentError);
      });
      test("should return ArgumentError on string with two decimals", () async {
        double btcRate = await BitcoinAPI.fetchCurrentBTCInUSD(client);

        expect(btcRate, isA<double>());

        expect(btcRate, 14934.5833);

        expect(() => ConversionTools.btc_to_usd('0.012.0', btcRate),
            throwsArgumentError);
      });
    });
  });
}
