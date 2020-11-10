class Recipe {
  int id;
  String user_id;
  String post_id;
  String author;
  String title_header;
  String body;
  String featured_image;
  int likes;
  int views;
  String created_at;


  Recipe.fromJson(Map<String, dynamic> data)
      : id = data['id'] ?? '',
        post_id = data['post_id'] ?? '',
        user_id = data['user_id'] ?? '',
        author = data['author'] ?? '',
        title_header = data['title_header'] ?? '',
        body = data['body'] ?? '',
        featured_image = data['featured_image'] ?? '',
        likes = data['likes'] ?? '',
        views = data['views'] ?? '',
        created_at = data['created_at'] ?? '';

  Recipe.map(dynamic data)
      : id = data.id ?? '',
        post_id = data.post_id ?? '',
        user_id = data.user_id ?? '',
        author = data.author ?? '',
        title_header = data.title_header ?? '',
        body = data.body ?? '',
        featured_image = data.featured_image ?? '',
        likes = data.likes ?? '',
        views = data.views ?? '',
        created_at = data.created_at ?? '';

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['id'] = id;
    map['user_id'] = post_id;
    map['post_id'] = post_id;
    map['author'] = author;
    map['title_header'] = title_header;
    map['body'] = body;
    map['featured_image'] = featured_image;
    map['likes'] = likes;
    map['views'] = views;
    map['created_at'] = created_at;
    return map;
  }
}
