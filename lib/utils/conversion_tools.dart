class ConversionTools {
  static double usd_to_btc(String usd) {
    if (usd.isEmpty) throw ArgumentError();
    if (!usd.contains(new RegExp(r'0-9'))) throw ArgumentError();

    double usdnum = double.parse(usd);
    double btc = 45987.90;

    double result = usdnum / btc;
    return result;
  }

  static double btc_to_usd(String btc) {
    if (btc.isEmpty) throw ArgumentError();
    if (!btc.contains(new RegExp(r'0-9'))) throw ArgumentError();

    double btcnum = double.parse(btc);
    double usd = 45987.90;

    double result = usd / btcnum;
    return result;
  }
}
