class Bookings {
  int id;
  String booking_id;
  String user_id;
  String chef_id;
  String dish;
  double dish_cost;
  String dish_time_frame;
  String more_detail;
  int booking_status;
  String booking_location;
  String created_at;



  Bookings.fromJson(Map<String, dynamic> data)
      : id = data['id'] ?? '',
        booking_id = data['booking_id'] ?? '',
        user_id = data['user_id'] ?? '',
        chef_id = data['chef_id'] ?? '',
        dish = data['dish'] ?? '',
        dish_cost = double.parse(data['dish_cost']) ?? '',
        dish_time_frame = data['dish_time_frame'] ?? '',
        more_detail = data['more_detail'] ?? '',
        booking_status = data['booking_status'] ?? '',
        booking_location = data['booking_location'] ?? '',
        created_at = data['created_at'] ?? '';

  Bookings.map(dynamic data)
      : id = data.id ?? '',
        booking_id = data.booking_id ?? '',
        user_id = data.user_id ?? '',
        chef_id = data.chef_id ?? '',
        dish = data.dish ?? '',
        dish_cost = double.parse(data.dish_cost) ?? '',
        dish_time_frame = data.dish_time_frame ?? '',
        more_detail = data.more_detail ?? '',
        booking_status = data.booking_status ?? '',
        booking_location = data.booking_location ?? '',
        created_at = data.created_at ?? '';

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['id'] = id;
    map['booking_id'] = booking_id;
    map['user_id'] = user_id;
    map['chef_id'] = chef_id;
    map['dish'] = dish;
    map['dish_cost'] = dish_cost;
    map['dish_time_frame'] = dish_time_frame;
    map['more_detail'] = more_detail;
    map['booking_status'] = booking_status;
    map['booking_location'] = booking_location;
    map['created_at'] = created_at;
    return map;
  }
}
