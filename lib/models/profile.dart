class Profile {
  String _id;
  String _name;
  String _avatar;
  String _phone;
  String _email;
  String _token;

  Profile.fromJson(Map<String, dynamic> data)
      : _id = data['user_id'] ?? '',
        _name = data['name'] ?? '',
        _avatar = data['avatar'] ?? '',
        _phone = data['phone'] ?? '',
        _email = data['email'] ?? '',
        _token = data['token'] ?? '';

  Profile.map(dynamic data)
      : _id = data['id'] ?? '',
        _name = data['name'] ?? '',
        _avatar = data['avatar'] ?? '',
        _phone = data['phone'] ?? '',
        _email = data['email'] ?? '',
        _token = data['token'] ?? '';

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['id'] = _id;
    map['name'] = _name;
    map['phone'] = _phone;
    map['email'] = _email;
    map['avatar'] = _avatar;
    map['token'] = _token;
    return map;
  }

  String get avatar => _avatar;
  String get name => _name;
  String get phone => _phone;
  String get email => _email;
  String get id => _id;



}
