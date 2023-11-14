import 'package:flutter/widgets.dart';

abstract class BaseProvider extends ChangeNotifier {
  BaseProvider();

  void clear();
}
