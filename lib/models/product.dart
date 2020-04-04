


class Product {
   int id;
   String title;
   String image;
   String description;
   String quantity;
   double price;
   bool fav;
   double rating;  

   Product.fromJson(Map<String,dynamic> data)
    : id = data['id'] ?? '',
      title = data['title'] ?? '',
      image= data['image'] ?? '',
      description = data['description'] ?? '',
      quantity = data['quantity'] ?? '',
      price =  data['price'] ?? '',
      fav=  data['fav'] == 1 ? true : false ?? '',
      rating=  data['rating'] ?? '';

   Product.map(dynamic data) 
     : id = data.id ?? '',
      title = data.title ?? '',
      image= data.image ?? '',
      description = data.description ?? '',
      quantity = data.quantity ?? '',
      price =  data.price ?? '',
      fav=  data.fav == 1 ? true : false ?? '',
      rating=  data.rating ?? '';
}

