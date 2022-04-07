import 'package:bitcoin_calculator/utils/conversion_tools.dart';
import 'package:test/test.dart';

void main() {
  group("Happy path", () {
    test("usd_to_btc should return proper calculation", () {
      var testConversion = ConversionTools.usd_to_btc('45987.90');
      expect(testConversion, 1.0);
    });

    test("btc_to_usd should return proper calculation", () {
      var testConversion = ConversionTools.btc_to_usd('1');
      expect(testConversion, 45987.90);
    });
  });

  group("Sad path", () {
    test("usd_to_btc should return ArgumentError on empty string", () {
      var testConversion = ConversionTools.usd_to_btc('');
      expect(testConversion, ArgumentError());
    }, skip: true);
  });
}
