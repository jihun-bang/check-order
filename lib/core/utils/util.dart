import 'dart:convert';

import 'package:flutter/services.dart';

class Util {
  Util._();

  static Future<dynamic> loadJsonFile(String fileName) async {
    final data = await rootBundle.loadString('assets/data/$fileName.json');
    return json.decode(data);
  }
}
