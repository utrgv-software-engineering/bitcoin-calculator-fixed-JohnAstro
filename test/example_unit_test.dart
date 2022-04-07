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
      expect(testConversion, 45987.9);
    });

    test(
        "btc_to_usd should return proper calculation with decimal input without leading digit",
        () {
      var testConversion = ConversionTools.btc_to_usd('.1');
      expect(testConversion, 4598.79);
    });
  });

  group("Sad path", () {
    group("usd_to_btc", () {
      test("should return ArgumentError on empty string", () {
        expect(() => ConversionTools.usd_to_btc(''), throwsArgumentError);
      });
      test("should return ArgumentError on string with a space", () {
        expect(() => ConversionTools.usd_to_btc(' '), throwsArgumentError);
      });
      test("should return ArgumentError on string with a '-'", () {
        expect(() => ConversionTools.usd_to_btc('-'), throwsArgumentError);
      });
      test("should return ArgumentError on string with invalid characters", () {
        expect(
            () => ConversionTools.usd_to_btc('%^vtjh,'), throwsArgumentError);
      });

      test("should return ArgumentError on string with two decimals", () {
        expect(
            () => ConversionTools.usd_to_btc('0.012.0'), throwsArgumentError);
      });
    });

    group("btc_to_usd", () {
      test("should return ArgumentError on empty string", () {
        expect(() => ConversionTools.btc_to_usd(''), throwsArgumentError);
      });
      test("should return ArgumentError on string with a space", () {
        expect(() => ConversionTools.btc_to_usd(' '), throwsArgumentError);
      });
      test("should return ArgumentError on string with a '-'", () {
        expect(() => ConversionTools.btc_to_usd('-'), throwsArgumentError);
      });
      test("should return ArgumentError on string with invalid characters", () {
        expect(
            () => ConversionTools.btc_to_usd('%^vtjh,'), throwsArgumentError);
      });
      test("should return ArgumentError on string with two decimals", () {
        expect(
            () => ConversionTools.btc_to_usd('0.012.0'), throwsArgumentError);
      });
    });
  });
}
