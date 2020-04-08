class Kitchen {
   int id;
   String title;
   String image;
   String location;
   bool fav;
   double rating;  

   Kitchen.fromJson(Map<String,dynamic> data)
    : id = data['id'] ?? null,
      title = data['title'] ?? '',
      image= data['image'] ?? '',
      location = data['location'] ?? '',
      fav=  data['fav'] == 1 ? true : false ?? '',
      rating=  data['rating'] ?? '';

   Kitchen.map(dynamic data) 
     : id = data.id ?? null,
      title = data.title ?? '',
      image= data.image ?? '',
      location = data.location ?? '',
      fav=  data.fav == 1 ? true : false ?? '',
      rating=  data.rating ?? '';
}