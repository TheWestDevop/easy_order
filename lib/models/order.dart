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
  String _user_id;
  String _delivery_state;
  String _delivery_lga;
  String _delivery_address;
  String _delivery_at;
  String _total_cost;
  String _coupon;
  List<dynamic> _order;
  String _order_type;
  String _created_at;
  String _updated_at;
  String _order_id;
  int _id;
  int _order_status;

  UserOrder.fromJson(Map<String, dynamic> data)
      : _id = data['id'] ?? '',
        _user_id = data['user_id'] ?? '',
        _order_id = data['order_id'] ?? '',
        _order_type =
            data['order_type'] == 1 ? 'Instant Order' : 'Pre Order' ?? '',
        _order_status = data['order_status'] ?? '',
        _order = json.decode(data['product_ordered'] ?? null),
        _total_cost = data['total_cost'] ?? '',
        _delivery_address = data['delivery_address'] ?? '',
        _delivery_lga = data['delivery_lga'] ?? '',
        _delivery_state = data['delivery_state'] ?? '',
        _delivery_at = data['delivery_at'] ?? '',
        _created_at = data['created_at'] ?? '',
        _updated_at = data['update_at'] ?? '',
        _coupon = data['coupon'] ?? '';

  UserOrder.map(dynamic data)
      : _id = data['id'] ?? '',
        _user_id = data['user_id'] ?? '',
        _order_id = data['order_id'] ?? '',
        _order_type =
            data['order_type'] == 1 ? 'Instant Order' : 'Pre Order' ?? '',
        _order_status = data['order_status'] ?? '',
        _order = json.decode(data['product_ordered'] ?? null),
        _total_cost = data['total_cost'] ?? '',
        _delivery_address = data['delivery_address'] ?? '',
        _delivery_lga = data['delivery_lga'] ?? '',
        _delivery_state = data['delivery_state'] ?? '',
        _delivery_at = data['delivery_at'] ?? '',
        _created_at = data['created_at'] ?? '',
        _updated_at = data['update_at'] ?? '',
        _coupon = data['coupon'] ?? '';

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['id'] = _id;
    map['user_id'] = _user_id;
    map['order_id'] = _order_id;
    map['order_status'] = _order_status;
    map['delivery_state'] = _delivery_state;
    map['delivery_lga'] = _delivery_lga;
    map['delivery_address'] = _delivery_address;
    map['delivery_at'] = _delivery_at;
    map['total_cost'] = _total_cost;
    map['coupon'] = _coupon;
    map['order'] = _order;
    map['order_type'] = _order_type;
    map['created_at'] = _created_at;
    map['updated_at'] = _updated_at;
    return map;
  }
}
