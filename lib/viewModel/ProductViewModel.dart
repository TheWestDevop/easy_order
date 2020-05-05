

import 'dart:io';

import 'package:easy_order/models/models.dart';
import 'package:easy_order/services/services.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:easy_order/viewModel/viewModel.dart';
import 'package:localstorage/localstorage.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class ProductViewModel extends Model {

  ProductService productService = locator<ProductService>();
  //AppViewModel _productViewModel = locator<AppViewModel>();
  String cartMessage = "";
  final LocalStorage storage = new LocalStorage('app_data');
  bool success = false;
  Directory tempDir;
  String tempPath;


  List<Product> _data = [];
  Database db;
  String _message;
  //AppState  _status = AppState.Idle;

  ///AppState get status => _status;

  String  get message => _message;

  ProductViewModel(){

    // Create DB Instance & Create Table
    createDB();

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
        this.db = db;
        print("OPEN DBV");
        this.createTable();
      }, onCreate: (Database db, int version) async {
        this.db = db;
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
      await this.db.execute(qry);
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

      await this.db.execute(qry);
      qry = "CREATE TABLE IF NOT EXISTS Profile( "
          "id INTEGER,"
          "name Text,"
          "image Text,"
          "phone Text,"
          "email Text,"
          "address Text,"
          "datetime DATETIME)";

      await this.db.execute(qry);
      qry = "CREATE TABLE IF NOT EXISTS Kitchen( "
          "id INTEGER,"
          "title Text,"
          "image Text,"
          "location Text,"
          "fav Text,"
          "rating REAL,"
          "datetime DATETIME)";

      await this.db.execute(qry);
      qry = "CREATE TABLE IF NOT EXISTS Chef( "
          "id INTEGER,"
          "name Text,"
          "image Text,"
          "location Text,"
          "experience Text,"
          "experience_years INTEGER,"
          "fav INTEGER,"
          "rating REAL,"
          "datetime DATETIME)";

      await this.db.execute(qry);


      var _flag = storage.getItem("isFirst");
      print("FLAG IS FIRST $_flag");

        if (_flag != null) {
        this.removeAllProduct();
        this.insertProductInLocal();
        this.fetchLocalProductData();
      } else {
        this.insertProductInLocal();
        this.insertEmptyProfileToLocal();
       // _authViewModel.getState();
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
      List<Map> list = await this.db.rawQuery('SELECT * FROM Products');
      list.map((dd) {
         Product product = new Product.fromJson(dd);
        _data.add(product);
        
      }).toList();
      notifyListeners();
    } catch (e) {
      print("ERRR %%%");
      print(e);
    }
  }

  insertEmptyProfileToLocal() async{
    try {
      await this.db.transaction((tx) async {
        
          print("Called insert empty user row ");
          try {
            var qry = 'INSERT INTO Profile(id,name,image,phone,email,address)';
              qry += 'VALUES(1,"","", "",';
              qry += '"","")';
            var _res = await tx.rawInsert(qry);
           
          } catch (e) {
            print("Error on insert user  >>>");
            print(e);
          }
          notifyListeners();
       // storage.setItem("isFirst", "true");
    });} catch (e) {
      print("ERRR ## > ");
      print(e);
    }
}

  insertProductInLocal() async {
      _data = [];
    try {
      await this.db.transaction((tx) async {
        List<Product> products = productService.getProducts();
        for (var i = 0; i < products.length; i++) {
          print("Called insert ${products[i].title}");
          Product product = new Product.map(products[i]);
          try {
            var qry = 'INSERT INTO products(title,image,description,quantity,price,fav,rating)';
              qry += 'VALUES("${product.title}","${product.image}", "${product.description}",';
              qry += '"${product.quantity}",${product.price},${product.fav ? 1 : 0 },';
              qry += '${product.rating})';

            var _res = await tx.rawInsert(qry);
            
          } catch (e) {
            print("ERRR >>>");
            print(e);
          }
          _data.add(product);
          notifyListeners();
        }
         print("Products Length ${_data.length}");
        storage.setItem("isFirst", "true");
      });
    } catch (e) {
      print("ERRR ## > ");
      print(e);
    }
  }
 
  


  // Item List
  List<Product> get itemListing => _data;

  // Item Add
  void addItem(Product product) {
    //setStatus(AppState.Busy);
    Product _product = new Product.map(product); 
    _data.add(_product);
    //setStatus(AppState.Retrieved);
    notifyListeners();
  }

removeAllProduct() async {
    try {
      var qry = "DELETE FROM Products";
      this.db.rawDelete(qry).then((data) {
        print("Products Deleted");
        notifyListeners();
      }).catchError((e) {
        print(e);
      });
    } catch (e) {
      print("ERR rm product${e}");
    }
  }
}