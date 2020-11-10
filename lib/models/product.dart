class Product {
  int id;
  String title;
  String image;
  String description;
  String quantity;
  double price;
  bool fav;
  double rating;

  Product.fromJson(Map<String, dynamic> data)
      : id = data['id'] ?? '',
        title = data['title'] ?? '',
        image = data['image'] ?? '',
        description = data['description'] ?? '',
        quantity = data['quantity'] ?? '1',
        price = data['price'] ?? '',
        fav = data['fav'] == 1 ? true : false ?? '',
        rating = data['rating'] ?? '';

  Product.map(dynamic data)
      : id = data.id ?? '',
        title = data.title ?? '',
        image = data.image ?? '',
        description = data.description ?? '',
        quantity = data.quantity ?? '1',
        price = data.price ?? '',
        fav = data.fav == 1 ? true : false ?? '',
        rating = data.rating ?? '';

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['id'] = id;
    map['title'] = title;
    map['image'] = image;
    map['description'] = description;
    map['quantity'] = quantity;
    map['price'] = price;
    map['fav'] = fav;
    map['rating'] = rating;
    return map;
  }

  Map<String, dynamic> cartToMap() {
    var map = new Map<String, dynamic>();
    map['title'] = title;
    map['quantity'] = quantity;
    map['price'] = price;
    return map;
  }
}

class UpcomingProduct {
  int id;
  String title;
  String image;
  String description;
  String quantity;
  double price;
  bool fav;
  double rating;
  String available_on;

  UpcomingProduct.fromJson(Map<String, dynamic> data)
      : id = data['id'] ?? '',
        title = data['title'] ?? '',
        image = data['image'] ?? '',
        description = data['description'] ?? '',
        quantity = data['quantity'] ?? '1',
        price = data['price'] ?? '',
        fav = data['fav'] == 1 ? true : false ?? '',
        rating = data['rating'] ?? '',
        available_on = data['available_on'] ?? '';

  UpcomingProduct.map(dynamic data)
      : id = data.id ?? '',
        title = data.title ?? '',
        image = data.image ?? '',
        description = data.description ?? '',
        quantity = data.quantity ?? '1',
        price = data.price ?? '',
        fav = data.fav == 1 ? true : false ?? '',
        rating = data.rating ?? '',
        available_on = data.available_on ?? '';

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['id'] = id;
    map['title'] = title;
    map['image'] = image;
    map['description'] = description;
    map['quantity'] = quantity;
    map['price'] = price;
    map['fav'] = fav;
    map['rating'] = rating;
    map['available_on'] = available_on;
    return map;
  }

}
