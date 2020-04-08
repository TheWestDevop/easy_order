

import 'package:easy_order/models/models.dart';
import 'package:easy_order/services/services.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:easy_order/viewModel/viewModel.dart';
import 'package:scoped_model/scoped_model.dart';

class KitchenViewModel extends Model {
 
   ProductViewModel _productViewModel = locator<ProductViewModel>();
   KitchenService kitchenService = locator<KitchenService>();



  List<Kitchen> _data = [];
  
   // Item List
  List<Kitchen> get itemListing => _data;


  KitchenViewModel(){
    //;
    
    //setStatus(AppState.Retrieved);
  }



  fetchKitchen() async {
    try {
      // Get the records
      _data = [];
      List<Map> list = await _productViewModel.db.rawQuery('SELECT * FROM kitchen');
      print("Kitchen length ${list.length.toString()}");
      list.map((dd) {
        Kitchen kitchen = new Kitchen.fromJson(dd);
        _data.add(kitchen);
      }).toList();
      notifyListeners();
    } catch (e) {
      print("Error @ Kitchen");
      print(e);
    }
  }

  insertKitchenToLocal() async {
      _data = [];
  
      await _productViewModel.db.transaction((tx) async {
        List<Kitchen> kitchens = kitchenService.getKitchens();
        for (var i = 0; i < kitchens.length; i++) {
          print("Called insert ${kitchens[i].title}");
          Kitchen kitchen = new Kitchen.map(kitchens[i]);
          try {
            var qry = 'INSERT INTO kitchen(title,image,location,fav,rating)';
              qry += 'VALUES("${kitchen.title}","${kitchen.image}", "${kitchen.location}",';
              qry += '${kitchen.fav ? 1 : 0 },';
              qry += '${kitchen.rating})';

            var _res = await tx.rawInsert(qry);

          } catch (e) {
            print("ERRR >>>");
            print(e);
          }
          _data.add(kitchen);
        } });
    }

  updateFavItem(Kitchen kitchen) async {
    try {
      var qry = "UPDATE Kitchen set fav = ${kitchen.fav ? 1 : 0} where id = ${kitchen.id}";
      _productViewModel.db.rawUpdate(qry).then((res) {
        print("UPDATE Kitchen ${res}");
      }).catchError((e) {
        print("UPDATE ERR Kitchen ${e}");
      });
    } catch (e) {
      print("ERRR @@");
      print(e);
    }
  }

  // Add In fav list
  addToFav(Kitchen kitchen) {
    //setStatus(AppState.Busy);
    //var _index = _data.indexWhere((d) => d.id == product.id);
    kitchen.fav = !kitchen.fav;
    //_data.insert(_index, product.fav);
    this.updateFavItem(kitchen);
    //setStatus(AppState.Retrieved);
    notifyListeners();
  }

  removeKitchens() async {
    try {
      var qry = "DELETE FROM Kitchen";
      _productViewModel.db.rawDelete(qry).then((data) {
      
        notifyListeners();
      }).catchError((e) {
        print(e);
      });
    } catch (e) {
      print("ERR rm cart${e}");
    }
  }
  
  book_kitchen(Kitchen kitchen){

  }

}