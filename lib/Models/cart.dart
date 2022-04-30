import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_catelog/Models/catelog.dart';
import 'package:flutter_catelog/core/store.dart';

class CartModel {
  //Catelog Fields
  late CatelogModel _catelog;

  //Collection of Ids
  final List<int> _itemIds = [];

  //Get Catelog
  CatelogModel get catelog => _catelog;

  set catelog(CatelogModel newCatelog) {
    // ignore: unnecessary_null_comparison
    assert(newCatelog != null);
    _catelog = newCatelog;
  }

  //Get Items in the cart
  List<Item> get items => _itemIds.map((id) => _catelog.getById(id)).toList();

  //Get Total Price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;
  AddMutation({
    required this.item,
  });
  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }

  @override
  String toString() => 'AddMutation(item: $item)';
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;
  RemoveMutation({
    required this.item,
  });
  @override
  perform() {
    store?.cart._itemIds.remove(item.id);
  }
}
