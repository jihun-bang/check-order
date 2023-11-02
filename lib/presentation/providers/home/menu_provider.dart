import 'package:check_order/data/models/menu/menu_item.dart';
import 'package:flutter/widgets.dart';

import '../../../domain/usecases/home/menu_usecase.dart';

class MenuProvider extends ChangeNotifier {
  final MenuUseCase _useCase;

  List<String> _categories = [];
  List<String> get categories => _categories;

  List<MenuItemModel> _items = [];
  List<MenuItemModel> get items => _items;

  MenuProvider(this._useCase) {
    _getCategories();
    _getItems();
  }

  Future<void> _getCategories() async {
    _categories = await _useCase.getCategories();
    notifyListeners();
  }

  Future<void> _getItems() async {
    _items = await _useCase.getItems();
    notifyListeners();
  }
}
