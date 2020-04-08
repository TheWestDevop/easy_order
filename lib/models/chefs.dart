
class Chef {
   int id;
   String name;
   String image;
   String location;
   String experience;
   int experience_years;
   bool fav;
   double rating;  

   Chef.fromJson(Map<String,dynamic> data)
    : id = data['id'] ?? '',
      name = data['name'] ?? '',
      image= data['image'] ?? '',
      location = data['location'] ?? '',
      experience = data['experience'] ?? '',
      experience_years = data['experience_years'] ?? '',
      fav=  data['fav'] == 1 ? true : false ?? '',
      rating=  data['rating'] ?? '';

   Chef.map(dynamic data) 
     : id = data.id ?? '',
      name = data.name ?? '',
      image= data.image ?? '',
      location = data.location ?? '',
      experience = data.experience ?? '',
      experience_years = data.experience_years ?? '',
      fav=  data.fav == 1 ? true : false ?? '',
      rating=  data.rating ?? '';
}