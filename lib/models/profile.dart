class Profile {
   int id;
   String name;
   String avatar;
   String phone;
   String address;
   String email;
  
    

   Profile.fromJson(Map<String,dynamic> data)
    : id = data['id'] ?? '',
      name = data['name'] ?? '',
      avatar= data['image'] ?? '',
      phone = data['phone'] ?? '',
      address = data['address'] ?? '',
      email=  data['email'] ?? '';

   Profile.map(dynamic data) 
     : id = data['id'] ?? '',
      name = data['name'] ?? '',
      avatar= data['image'] ?? '',
      phone = data['phone'] ?? '',
      address = data['address'] ?? '',
      email=  data['email'] ?? '';

  Map<String,dynamic> toMap(){
   var map =  new Map<String,dynamic>();
  map['id']= name;
   map['name']= name;
   map['phone']= phone;
   map['address']= address;
   map['email']= email;
   map['avatar']= avatar;
   return map;
 }
}