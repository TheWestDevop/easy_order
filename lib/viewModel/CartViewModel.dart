import 'dart:io';

import 'package:easy_order/models/models.dart';
import 'package:localstorage/localstorage.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class CartViewModel extends Model {
  // OrderService _orderService = locator.get<OrderService>();
  String cartMessage = "";
  final LocalStorage storage = new LocalStorage('app_data');
  bool success = false;
  Directory tempDir;
  String tempPath;

  Database _db;
  String _message;

  String get message => _message;

  List<Product> _cart = [];
  double sub_total;

  CartViewModel() {
    createDB();
  }

  deleteDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'smor_cart.db');

    await deleteDatabase(path);
    if (storage.getItem("isFirst") != null) {
      await storage.deleteItem("isFirst");
    }
  }

  Future createDB() async {
    try {
      Directory documentsDirectory = await getApplicationDocumentsDirectory();
      String path = join(documentsDirectory.path, 'smor_cart.db');

      // print(path);
      // await storage.deleteItem("isFirst");
      // await this.deleteDB();

      var database =
          await openDatabase(path, version: 1, onOpen: (Database db) {
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

  Future createTable() async {
    try {
      var qry = "CREATE TABLE IF NOT EXISTS cart_list ( "
          "id INTEGER PRIMARY KEY,"
          "title Text,"
          "description TEXT,"
          "image Text,"
          "quantity Text,"
          "price REAL,"
          "fav INTEGER,"
          "rating REAL,"
          "datetime DATETIME)";

      await _db.execute(qry);

      var _flag = storage.getItem("isFirst");
      this.fetchCartList();
      print("FLAG IS FIRST $_flag");
    } catch (e) {
      print("ERRR ^^^");
      print(e);
    }
  }

  Future<List<Product>> fetchCartList() async {
    // try {
    // Get the records

    // createDB();
    _cart = [];
    List<Map> list = await _db.rawQuery('SELECT * FROM cart_list');
    // print("Carts $list");
    list.map((dd) {
      // print("Carts $dd");
      Product cart_item = Product.fromJson(dd);
      _cart.add(cart_item);
    }).toList();
    get_Sub_Total();
    notifyListeners();
    return _cart;

    // } catch (e) {
    //   print("ERRR @##@");
    //   print(e);
    // }
  }

  insertProductToCart(Product product) async {
    await _db.transaction((tx) async {
      try {
        var qry =
            'INSERT INTO cart_list(title,description,image,quantity,price,fav,rating)';
        qry += 'VALUES("${product.title}","${product.description}",';
        qry += '"${product.image}", "${product.quantity}",${product.price},';
        qry += '${product.fav ? 1 : 0},${product.rating})';
        await tx.execute(qry);
        this.fetchCartList();
      } catch (e) {
        print("ERRR @@ @@");
        print(e);
      }
    });
  }

  updateFavItem(Product product) async {
    // try {
    //   var qry =
    //       "UPDATE Products set fav = ${product.fav ? 1 : 0} where id = ${product.id}";
    //   _db.rawUpdate(qry).then((res) {
    //     print("UPDATE RES ${res}");
    //   }).catchError((e) {
    //     print("UPDATE ERR ${e}");
    //   });
    // } catch (e) {
    //   print("ERRR @@");
    //   print(e);
    // }
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
  double get cart_cost => sub_total;

  void increaseQuantity(Product product) async {
    // print("product --> $product");
    try {
      var cart = await _db
          .rawQuery('SELECT * FROM cart_list WHERE id = ${product.id}');
      int quantity = int.parse(cart[0]['quantity']) + 1;
      var qry =
          "UPDATE cart_list set quantity = $quantity where id = ${product.id}";
      var res = await _db.rawUpdate(qry);
      var ncart = await _db.rawQuery('SELECT * FROM cart_list');
      // print("CART ITEMS ${ncart}");
      // this.sumTotal();
      this.fetchCartList();
      notifyListeners();
    } catch (e) {
      print("ERRR @@");
      print(e);
    }
  }

  void decreaseQuantity(Product product) async {
    try {
      var cart = await _db
          .rawQuery('SELECT * FROM cart_list WHERE id = ${product.id}');
      int quantity = int.parse(cart[0]['quantity']) - 1;
      var qry =
          "UPDATE cart_list set quantity = $quantity where id = ${product.id}";
      var res = await _db.rawUpdate(qry);
      this.fetchCartList();
      // print("UPDATE CART ${res}");
      notifyListeners();
    } catch (e) {
      print("ERRR @@");
      print(e);
    }
  }

  // Add Cart
  void addCart(Product product) {
    print(product.id);
    print(_cart);
    int _index =
        _cart.indexWhere((_cartItem) => _cartItem.title == product.title);
    if (_index > -1) {
      success = false;
      cartMessage = "${product.title.toUpperCase()} already added to Cart.";
      notifyListeners();
    } else {
      this.insertProductToCart(product);
      _cart.add(product);
      success = true;
      cartMessage =
          "${product.title.toUpperCase()} successfully added to Cart.";

      notifyListeners();
    }
  }

  removeCartDB(Product product) async {
    try {
      var qry = "DELETE FROM cart_list where id = ${product.id}";
      _db.rawDelete(qry).then((data) {
        print(data);
        int _index = _cart.indexWhere((dd) => dd.id == product.id);
        _cart.removeAt(_index);
        this.fetchCartList();
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

  void update_total_base_on_coupon(double amount) async {
    sub_total -= amount;
    notifyListeners();
  }

  void clear_cart() async {
    _cart.clear();
    await _db.rawQuery('TRUNCATE cart_list');
    await  this.fetchCartList();
    notifyListeners();
  }

  double get_Sub_Total() {
    sub_total = _cart
        .map((a) => a.price * int.parse(a.quantity))
        .fold(0, (prev, amount) => prev + amount);
  }
}
