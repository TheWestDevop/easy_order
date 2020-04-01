
 import 'dart:io';

class Order {
   
   String  _note;
   String  _name;
   String  _phone;
   String  _address;
   String  _email;
   String  _avatar;
   String  _order;
   int  _order_type;
   

  Order(this._name,this._email,this._phone,this._address,this._avatar,this._order,this._order_type,this._note);
  
  
  String get profile_note => _note;
  String get profile_name => _name;
  String get profile_phone => _phone;
  String get profile_address => _address;
  String get profile_email => _email;
  String get profile_avatar => _avatar;
  String get profile_order => _order;
  int get profile_order_type => _order_type;

 Order.fromJson(Map<String,dynamic> data)
    : _note = data['note'] ?? '',
      _name = data['name'] ?? '',
      _phone = data['phone'] ?? '',
      _address = data['address'] ?? '',
      _email = data['email'] ?? '',
      _avatar=  data['avatar'] ?? '',
      _order=  data['store'] ?? '',
      _order_type=  data['order_type'] ?? '';

 Order.map(dynamic data) 
     : 
      _name = data['name'] ?? '',
      _phone = data['phone'] ?? '',
      _address = data['address'] ?? '',
      _email = data['email'] ?? '',
      _avatar=  data['avatar'] ?? '',
      _order=  data['store'] ?? '',
      _order_type=  data['order_type'] ?? '';

 Map<String,dynamic> toMap(){
   var map =  new Map<String,dynamic>();
   map['name']= profile_name;
   map['phone']= profile_phone;
   map['address']= profile_address;
   map['email']= profile_email;
   map['avatar']= profile_avatar;
   map['store']= profile_order;
   map['order_type']=profile_order_type;
      return map;
 }

 }