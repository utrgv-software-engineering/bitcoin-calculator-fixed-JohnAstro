class ConversionTools {
  static double usd_to_btc(String usd) {
    double usdnum = double.parse(usd);
    double btc = 45987.90;

    double result = usdnum / btc;
    return result;
  }

  static double btc_to_usd(String usd) {
    double usdnum = double.parse(usd);
    double btc = 45987.90;

    double result = btc / usdnum;
    return result;
  }
}
