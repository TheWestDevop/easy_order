

import 'dart:io';

import 'package:easy_order/models/models.dart';
import 'package:easy_order/services/services.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:localstorage/localstorage.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class CartViewModel extends Model {

  ProductService storageService = locator<ProductService>();
  String cartMessage = "";
  final LocalStorage storage = new LocalStorage('app_data');
  bool success = false;
  Directory tempDir;
  String tempPath;

  List<Product> _cart = [];
  List<Product> _data = [];
  Database _db;
  String _message;
  AppState  _status = AppState.Idle;

  AppState get status => _status;

  String  get message => _message;

  CartViewModel(){
    // Create DB Instance & Create Table
    createDB();
    setStatus(AppState.Retrieved);
  }
    void setStatus(AppState state) {
        _status = state;
       }

  deleteDB() async {

    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'smor_product.db');

    await deleteDatabase(path);
    if (storage.getItem("isFirst") != null) {
      await storage.deleteItem("isFirst");
    }
  }

  createDB() async {

    try {
      Directory documentsDirectory = await getApplicationDocumentsDirectory();
      String path = join(documentsDirectory.path, 'smor_product.db');

      print(path);
      //await storage.deleteItem("isFirst");
      //await this.deleteDB();

     var database = await openDatabase(path, version: 1, onOpen: (Database db) {
        this._db = db;
        print("OPEN DBV");
        this.createTable();
      }, onCreate: (Database db, int version) async {
        this._db = db;
        print("DB Created");
      });
    } catch (e) {
      print("ERRR >>>>");
      print(e);
    }
  }

  createTable() async {
    try {
      var qry = "CREATE TABLE IF NOT EXISTS Products ( "
          "id INTEGER PRIMARY KEY,"
          "title TEXT,"
          "image Text,"
          "description Text,"
          "quantity Text,"
          "price REAL,"
          "fav INTEGER,"
          "rating REAL,"
          "datetime DATETIME)";
      await this._db.execute(qry);
      qry = "CREATE TABLE IF NOT EXISTS cart_list ( "
          "id INTEGER PRIMARY KEY,"
          "title INTEGER,"
          "description TEXT,"
          "image Text,"
          "quantity INTEGER,"
          "price REAL,"
          "fav INTEGER,"
          "rating REAL,"
          "datetime DATETIME)";

      await this._db.execute(qry);


      var _flag = storage.getItem("isFirst");
      print("FLAG IS FIRST $_flag");

        if (_flag != null) {
        this.fetchLocalProductData();
        this.fetchCartList();
      } else {
        this.insertProductInLocal();
      }
      
        
    } catch (e) {
      print("ERRR ^^^");
      print(e);
    }
  }

  fetchLocalProductData() async {
    _data = [];
    try {
      // Get the records
      List<Map> list = await this._db.rawQuery('SELECT * FROM Products');
      list.map((dd) {

        Product product = new Product();
        product.id = dd["id"];
        product.title =   dd["title"];
        product.image = dd["image"];
        product.description = dd["description"];
        product.quantity = dd["quantity"];
        product.price = dd["price"];
        product.fav =  dd["fav"] == 1 ? true : false;
        product.rating =  dd["rating"];

        _data.add(product);
        
      }).toList();
      notifyListeners();
    } catch (e) {
      print("ERRR %%%");
      print(e);
    }
  }

  insertProductInLocal() async {
      _data = [];
    try {
      await this._db.transaction((tx) async {
        for (var i = 0; i < products.length; i++) {
          print("Called insert ${products[i]["title"]}");
          Product product = new Product();
          product.id = i+1;
          product.title = products[i]["title"];
          product.image = products[i]["image"];
          product.description = products[i]["description"];
          product.quantity = products[i]["quantity"];
          product.price = products[i]["price"];
          product.fav =  products[i]["fav"] == 1 ? true : false;
          product.rating =  products[i]["rating"];
          try {
            var qry = 'INSERT INTO products(title,image,description,quantity,price,fav,rating)';
              qry += 'VALUES("${products[i]["title"]}","${products[i]["image"]}", "${products[i]["description"]}",';
              qry += '"${products[i]["quantity"]}",${products[i]["price"]},${products[i]["fav"] == true ? 1 : 0},';
              qry += '${products[i]["rating"]})';

            var _res = await tx.rawInsert(qry);

          } catch (e) {
            print("ERRR >>>");
            print(e);
          }
          _data.add(product);
          notifyListeners();
        }

        storage.setItem("isFirst", "true");
      });
    } catch (e) {
      print("ERRR ## > ");
      print(e);
    }
  }

  insertProductToCart(Product product) async {
    
    await this._db.transaction((tx) async {
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

  fetchCartList() async {
    try {
      // Get the records
      _cart = [];
      List<Map> list = await this._db.rawQuery('SELECT * FROM cart_list');
      print("Cart len ${list.length.toString()}");
      list.map((dd) {
        Product cart_item = new Product();
        cart_item.id = dd["id"];
        cart_item.title =   dd["title"];
        cart_item.image = dd["image"];
        cart_item.description = dd["description"];
        cart_item.quantity = dd["quantity"];
        cart_item.price = dd["price"];
        cart_item.fav =  dd["fav"] == 1 ? true : false;
        cart_item.rating =  dd["rating"];
        _cart.add(cart_item);
      }).toList();
      notifyListeners();
    } catch (e) {
      print("ERRR @##@");
      print(e);
    }
  }

  updateFavItem(Product product) async {
    try {
      var qry = "UPDATE Products set fav = ${product.fav ? 1 : 0} where id = ${product.id}";
      this._db.rawUpdate(qry).then((res) {
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

  // Item List
  List<Product> get itemListing => _data;

  

  // Item Add
  void addItem(Product product) {
    int id = _data.length + 1;
    Product _product = new Product();;
        _product.id = id;
        _product.title = product.title;
        _product.image = product.image;
        _product.description = product.description;
        _product.quantity = product.quantity;
        _product.price = product.price;
        _product.fav =  product.fav == 1 ? true : false;
        _product.rating =  product.rating;
      
    _data.add(_product);
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
      this._db.rawDelete(qry).then((data) {
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

  //static instance() {}


}