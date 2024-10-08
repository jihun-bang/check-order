import 'package:check_order/features/home/data/models/menu_item.dart';

import '../../../../base_provider.dart';
import '../../domain/usecases/menu_usecase.dart';

class MenuProvider extends BaseProvider {
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

  @override
  void clear() {}
}
