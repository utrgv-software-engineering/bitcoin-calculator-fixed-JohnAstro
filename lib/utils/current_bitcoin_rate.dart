import 'dart:ffi';

class CurrentBTCInUSD {
  final double rateFloat;

  const CurrentBTCInUSD({
    this.rateFloat,
  });

  factory CurrentBTCInUSD.fromJson(Map<dynamic, dynamic> json) {
    return CurrentBTCInUSD(rateFloat: json['bpi']['USD']['rate_float']);
  }
}
