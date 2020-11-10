class Category {
  int id;
  String icon;
  String title;


  Category.fromJson(Map<String, dynamic> data)
      : id = data['id'] ?? '',
        icon = data['icon'] ?? '',
        title = data['title'] ?? '';

  Category.map(dynamic data)
      : id = data.id ?? '',
        icon = data.icon ?? '',
        title = data.title ?? '';

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['id'] = id;
    map['icon'] = icon;
    map['title'] = title;
    return map;
  }
}
