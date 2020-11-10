import 'dart:convert';

class Order {
  String user_id;
  String delivery_state;
  String delivery_lga;
  String delivery_address;
  String delivery_at;
  String total_cost;
  String coupon;
  List<dynamic> order;
  String order_type;

  Order(
      {this.user_id,
      this.delivery_state,
      this.delivery_lga,
      this.delivery_address,
      this.delivery_at,
      this.total_cost,
      this.coupon,
      this.order,
      this.order_type});

  Map<String, dynamic> toMap() {
    var orderEncode = json.encode(order);
    var map = new Map<String, dynamic>();
    map['user_id'] = user_id;
    map['delivery_state'] = delivery_state;
    map['delivery_lga'] = delivery_lga;
    map['delivery_address'] = delivery_address;
    map['delivery_at'] = delivery_at;
    map['total_cost'] = total_cost;
    map['coupon'] = coupon;
    map['product_ordered'] = orderEncode;
    map['order_type'] = order_type;
    return map;
  }
}

class UserOrder {
  String user_id;
  String delivery_state;
  String delivery_lga;
  String delivery_address;
  String delivery_at;
  String total_cost;
  String coupon;
  List<dynamic> order;
  String order_type;
  String created_at;
  String updated_at;
  String order_id;
  int id;
  int order_status;

  UserOrder.fromJson(Map<String, dynamic> data)
      : id = data['id'] ?? '',
        user_id = data['user_id'] ?? '',
        order_id = data['order_id'] ?? '',
        order_type =
            data['order_type'] == 1 ? 'Instant Order' : 'Pre Order' ?? '',
        order_status = data['order_status'] ?? '',
        order = json.decode(data['product_ordered'] ?? null),
        total_cost = data['total_cost'] ?? '',
        delivery_address = data['delivery_address'] ?? '',
        delivery_lga = data['delivery_lga'] ?? '',
        delivery_state = data['delivery_state'] ?? '',
        delivery_at = data['delivery_at'] ?? '',
        created_at = data['created_at'] ?? '',
        updated_at = data['update_at'] ?? '',
        coupon = data['coupon'] ?? '';

  UserOrder.map(dynamic data)
      : id = data['id'] ?? '',
        user_id = data['user_id'] ?? '',
        order_id = data['order_id'] ?? '',
        order_type =
            data['order_type'] == 1 ? 'Instant Order' : 'Pre Order' ?? '',
        order_status = data['order_status'] ?? '',
        order = json.decode(data['product_ordered'] ?? null),
        total_cost = data['total_cost'] ?? '',
        delivery_address = data['delivery_address'] ?? '',
        delivery_lga = data['delivery_lga'] ?? '',
        delivery_state = data['delivery_state'] ?? '',
        delivery_at = data['delivery_at'] ?? '',
        created_at = data['created_at'] ?? '',
        updated_at = data['update_at'] ?? '',
        coupon = data['coupon'] ?? '';

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['id'] = id;
    map['user_id'] = user_id;
    map['order_id'] = order_id;
    map['order_status'] = order_status;
    map['delivery_state'] = delivery_state;
    map['delivery_lga'] = delivery_lga;
    map['delivery_address'] = delivery_address;
    map['delivery_at'] = delivery_at;
    map['total_cost'] = total_cost;
    map['coupon'] = coupon;
    map['order'] = order;
    map['order_type'] = order_type;
    map['created_at'] = created_at;
    map['updated_at'] = updated_at;
    return map;
  }
}
