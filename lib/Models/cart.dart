import 'package:flutter_catelog/Models/catelog.dart';

class CartModel {
  //Catelog Fields
  late CatelogModel _catelog;

  //Collection of Ids
  final List<int> _itemIds = [];

  //Get Catelog
  CatelogModel get catelog => _catelog;

  set catelog(CatelogModel newCatelog) {
    assert(newCatelog != null);
    _catelog = newCatelog;
  }

  //Get Items in the cart
  List<Item> get items => _itemIds.map((id) => _catelog.getById(id)).toList();

  //Get Total Price
  num get totalPrice => items.fold(0, (total, current) => current.price);

  //Add Item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  //Remove Item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
