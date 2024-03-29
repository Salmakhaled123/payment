class ItemsList {
  ItemsList({
    this.items,
  });

  ItemsList.fromJson(dynamic json) {
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items?.add(OrderItemsModel.fromJson(v));
      });
    }
  }
  List<OrderItemsModel>? items;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (items != null) {
      map['items'] = items?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class OrderItemsModel {
  OrderItemsModel({
    this.name,
    this.quantity,
    this.price,
    this.currency,
  });

  OrderItemsModel.fromJson(dynamic json) {
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
    currency = json['currency'];
  }
  String? name;
  int? quantity;
  String? price;
  String? currency;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['quantity'] = quantity;
    map['price'] = price;
    map['currency'] = currency;
    return map;
  }
}
