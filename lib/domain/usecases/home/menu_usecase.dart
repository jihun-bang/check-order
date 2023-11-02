import 'package:check_order/data/models/menu/menu_item.dart';

import '../../../core/utils/util.dart';

class MenuUseCase {
  MenuUseCase();

  Future<List<String>> getCategories() async {
    final List<dynamic> categories =
        (await Util.loadJsonFile('dummy_categories'))['categories'];
    return categories.map((item) => item.toString()).toList();
  }

  Future<List<MenuItemModel>> getItems() async {
    final items = await Util.loadJsonFile('dummy_menu') as List;
    return items.map((e) => MenuItemModel.fromJson(e)).toList();
  }
}
