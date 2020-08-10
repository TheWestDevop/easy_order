
class Chef {
   int id;
   String user_id;
   String nickname;
   String dish;
   String icon;
   String state;
   String lga;
   String details;
   String experience;
   double rating;  

   Chef.fromJson(Map<String,dynamic> data)
    : id = data['id'] ?? '',
      user_id = data['user_id'] ?? '',
      nickname = data['nickname'] ?? '',
      dish = data['dish'] ?? '',
      icon = data['icon'] ?? '',
      state = data['state'] ?? '',
      lga = data['lga'] ?? '',
      details = data['details'] ?? '',
      experience = data['experience'] ?? '',
      rating=  data['rating'] ?? '';

   Chef.map(dynamic data) 
     : id = data.id ?? '',
       user_id = data.user_id ?? '',
       nickname = data.nickname ?? '',
       dish = data.dish ?? '',
       icon= data.icon ?? '',
      state = data.state ?? '',
      lga = data.lga ?? '',
      details = data.details ?? '',
      experience = data.experience ?? '',
      rating=  data.rating ?? '';
}