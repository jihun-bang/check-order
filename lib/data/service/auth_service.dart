import 'dart:convert';

import 'package:check_order/data/models/table/table_info_model.dart';
import 'package:check_order/presentation/providers/cart/cart_provider.dart';
import 'package:check_order/presentation/providers/employee_call/employee_call_provider.dart';
import 'package:check_order/presentation/providers/home/menu_provider.dart';
import 'package:check_order/presentation/providers/order/order_provider.dart';
import 'package:flutter/widgets.dart';

import '../../dependencies_injection.dart';
import '../../main.dart';

class AuthService extends ChangeNotifier {
  TableInfoModel _tableInfo = TableInfoModel();
  TableInfoModel get tableInfo => _tableInfo;

  AuthService() {
    getTable();
  }

  Future<void> update(TableInfoModel model) async {
    _tableInfo = model;
    notifyListeners();
  }

  Future<void> getTable() async {
    await storage.read(key: 'tableInfo').then((value) {
      if (value != null) {
        _tableInfo = TableInfoModel.fromJson(jsonDecode(value));
        notifyListeners();
      }
    });
  }

  Future<bool> save() async {
    if (tableInfo.isValid) {
      await storage.write(key: 'tableInfo', value: jsonEncode(tableInfo));
    }
    return tableInfo.isValid;
  }

  Future<void> logOut() async {
    _tableInfo = TableInfoModel();
    sl<CartProvider>().clear();
    sl<EmployeeCallProvider>().clear();
    sl<MenuProvider>().clear();
    sl<OrderProvider>().clear();
    await storage.delete(key: 'tableInfo');
  }
}
