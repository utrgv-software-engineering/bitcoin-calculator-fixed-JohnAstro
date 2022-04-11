class ConversionTools {
  static double usd_to_btc(String usd, double currentBTCValue) {
    bool _validate = checkInvalidInput(usd);

    if (!_validate) {
      double usdnum = double.parse(usd);
      double btc = currentBTCValue;

      double result = usdnum / btc;
      return result;
    } else {
      throw ArgumentError();
    }
  }

  static double btc_to_usd(String btc, double currentBTCValue) {
    bool _validate = checkInvalidInput(btc);

    if (!_validate) {
      double btcnum = double.parse(btc);
      double usd = currentBTCValue;

      double result = usd * btcnum;
      return result;
    } else {
      throw ArgumentError();
    }
  }

  static bool checkInvalidInput(String input) {
    // Throw ArgumentError on empty string
    if (input.isEmpty) return true;
    // Throw ArgumentError on string with a space
    if (input.contains(' ')) return true;
    // Throw ArgumentError on string with a dash i.e., negative numbers
    if (input.contains('-')) return true;

    // Throw ArgumentError on string with invalid characters and more than
    // one decimal point
    int decimalCount = 0;
    for (int i = 0; i < input.length; i++) {
      if ('0123456789'.contains(input[i])) {
        // Do nothing if it's a number
        continue;
      } else if (input[i] == '.') {
        // If it's a decimal, count it
        decimalCount++;
        if (decimalCount > 1) {
          // If there is more than one decimal count throw ArgumentError
          return true;
        }
      } else {
        return true;
      }
    }
    return false;
  }
}
