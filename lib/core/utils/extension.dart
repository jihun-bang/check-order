import 'package:intl/intl.dart';

extension IntExtensions on int {
  String toCommaString() {
    return NumberFormat('#,###').format(this);
  }
}
