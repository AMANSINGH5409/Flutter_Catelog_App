class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      image: map["image"],
    );
  }

  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image,
      };
}

class CatelogModel {
  static List<Item> items = [
    // Item(
    //     id: 1,
    //     name: "APPLE iPhone 12",
    //     desc: "A14 Bionic Chip with Next Generation",
    //     price: 999,
    //     color: "#f46755",
    //     image:
    //         "https://rukminim2.flixcart.com/image/312/312/kg8avm80/mobile/q/8/f/apple-iphone-12-dummyapplefsn-original-imafwg8drqaam5vu.jpeg?q=70")
  ];
}
