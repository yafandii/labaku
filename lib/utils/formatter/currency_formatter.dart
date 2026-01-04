import 'package:intl/intl.dart';

class CurrencyFormatter {
  static String idr(num value) {
    return NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp. ',
      decimalDigits: 0,
    ).format(value);
  }

  static String usd(num value) {
    return NumberFormat.currency(
      locale: 'en_US',
      symbol: '\$ ',
      decimalDigits: 2,
    ).format(value);
  }

  static String shortIdr(num value) {
    final absValue = value.abs();

    String format(num val) {
      return NumberFormat(
        '#,##0.#',
        'id_ID',
      ).format(val);
    }

    if (absValue >= 1000000000) {
      return 'Rp ${format(value / 1000000000)}M';
    }

    if (absValue >= 1000000) {
      return 'Rp ${format(value / 1000000)}jt';
    }

    if (absValue >= 1000) {
      return 'Rp ${format(value / 1000)}rb';
    }

    return 'Rp ${format(value)}';
  }
}
