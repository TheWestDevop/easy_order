


import 'package:easy_order/models/models.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:easy_order/viewModel/viewModel.dart';
import 'package:scoped_model/scoped_model.dart';


class CartViewModel extends Model {
  
 // OrderService _orderService = locator.get<OrderService>();
  ProductViewModel _productViewModel = locator<ProductViewModel>();
  String cartMessage = "";

  bool success = false;
 
  List<Product> _cart = [];
 
  CartViewModel(){
    //this.fetchCartList();
  }

  fetchCartList() async {
      try {
        // Get the records
        _cart = [];
        List<Map> list = await _productViewModel.db.rawQuery('SELECT * FROM cart_list');
        print("Cart len ${list.length.toString()}");
        list.map((dd) {
          Product cart_item = new Product.fromJson(dd);
          _cart.add(cart_item);
        }).toList();
        notifyListeners();
      } catch (e) {
        print("ERRR @##@");
        print(e);
      }
    }

    insertProductToCart(Product product) async {
      
      await _productViewModel.db.transaction((tx) async {
        try {
          var qry = 'INSERT INTO cart_list(title,description,image,quantity,price,fav,rating)';
            qry += 'VALUES("${product.title}","${product.description}",';
            qry += '"${product.image}", "${product.quantity}",${product.price},';
            qry += '${product.fav ? 1 : 0},${product.rating})';
          var _res = await tx.execute(qry);
          this.fetchCartList();
        } catch (e) {
          print("ERRR @@ @@");
          print(e);
        }
      });
    }

    updateFavItem(Product product) async {

      try {
        var qry = "UPDATE Products set fav = ${product.fav ? 1 : 0} where id = ${product.id}";
        _productViewModel.db.rawUpdate(qry).then((res) {
          print("UPDATE RES ${res}");
        }).catchError((e) {
          print("UPDATE ERR ${e}");
        });
      } catch (e) {
        print("ERRR @@");
        print(e);
      }
    }

    // Add In fav list
    addToFav(Product product) {
      
      //var _index = _data.indexWhere((d) => d.id == product.id);
      product.fav = !product.fav;
      //_data.insert(_index, product.fav);
      this.updateFavItem(product);
    
      notifyListeners();
    }

    

    // Cart Listing
    List<Product> get cartListing => _cart;

    // Add Cart
    void addCart(Product product) {
      print(product.id);
      print(_cart);
      int _index = _cart.indexWhere((_cartItem) => _cartItem.title == product.title);
      if (_index > -1) {
        success = false;
        cartMessage = "${product.title.toUpperCase()} already added to Cart.";
        notifyListeners();
      } else {
        this.insertProductToCart(product);
        _cart.add(product);
        success = true;
        cartMessage = "${product.title.toUpperCase()} successfully added to Cart.";

        notifyListeners();
      }
    }

    removeCartDB(Product product) async {
      try {
        var qry = "DELETE FROM cart_list where id = ${product.id}";
        _productViewModel.db.rawDelete(qry).then((data) {
          print(data);
          int _index = _cart.indexWhere((dd) => dd.id == product.id);
          _cart.removeAt(_index);
          notifyListeners();
        }).catchError((e) {
          print(e);
        });
      } catch (e) {
        print("ERR rm cart${e}");
      }
    }

    // Remove Cart
    void removeCart(Product product) {
      this.removeCartDB(product);
    }




}