import 'package:flutter_catelog/Models/cart.dart';
import 'package:flutter_catelog/Models/catelog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  late CatelogModel catelog;
  late CartModel cart;

  MyStore() {
    catelog = CatelogModel();
    cart = CartModel();
    cart.catelog = catelog;
  }
}
