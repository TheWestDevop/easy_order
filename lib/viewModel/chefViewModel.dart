

import 'package:easy_order/models/models.dart';
import 'package:easy_order/services/services.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:easy_order/viewModel/viewModel.dart';
import 'package:scoped_model/scoped_model.dart';

class ChefViewModel extends Model {
 
   ProductViewModel _productViewModel = locator<ProductViewModel>();
   ChefService chefService = locator<ChefService>();


  List<Chef> _data = [];
  
   // Item List
  List<Chef> get itemListing => _data;



  ChefViewModel(){
    //;
    
    
  }



  fetchChef() async {
    try {
      // Get the records
      _data = [];
      List<Map> list = await _productViewModel.db.rawQuery('SELECT * FROM Chef');
      print("Chef length ${list.length.toString()}");
      list.map((dd) {
        Chef chef = new Chef.fromJson(dd);
        _data.add(chef);
      }).toList();
      notifyListeners();
    } catch (e) {
      print("Error @ Chef");
      print(e);
    }
  }

  insertChefToLocal() async {
      _data = [];
  
      await _productViewModel.db.transaction((tx) async {
        List<Chef> chefs = chefService.getChefs();
        for (var i = 0; i < chefs.length; i++) {
          print("Called insert ${chefs[i].name}");
          Chef chef = new Chef.map(chefs[i]);
          try {
            var qry = 'INSERT INTO Chef(name,image,location,experience,experience_years,fav,rating)';
              qry += 'VALUES("${chef.name}","${chef.image}", "${chef.location}",';
              qry += '"${chef.experience}",${chef.experience_years},${chef.fav ? 1 : 0 },';
              qry += '${chef.rating})';

            var _res = await tx.rawInsert(qry);

          } catch (e) {
            print("ERRR >>>");
            print(e);
          }
          _data.add(chef);
        } });
    }

  updateFavItem(Chef chef) async {
    try {
      var qry = "UPDATE Chef set fav = ${chef.fav ? 1 : 0} where id = ${chef.id}";
      _productViewModel.db.rawUpdate(qry).then((res) {
        print("UPDATE Chef ${res}");
      }).catchError((e) {
        print("UPDATE ERR Chef ${e}");
      });
    } catch (e) {
      print("ERRR @@");
      print(e);
    }
  }

  // Add In fav list
  addToFav(Chef chef) {
    //setStatus(AppState.Busy);
    //var _index = _data.indexWhere((d) => d.id == product.id);
    chef.fav = !chef.fav;
    //_data.insert(_index, product.fav);
    this.updateFavItem(chef);
    //setStatus(AppState.Retrieved);
    notifyListeners();
  }

  removeChefs() async {
    try {
      var qry = "DELETE FROM Chef";
      _productViewModel.db.rawDelete(qry).then((data) {
      
        notifyListeners();
      }).catchError((e) {
        print(e);
      });
    } catch (e) {
      print("ERR rm chef${e}");
    }
  }
  
  book_Chef(Chef chef){

  }

}