part of 'kitchen.dart';


class KitchenPage extends StatefulWidget {

  @override
  _KitchenPageState createState() => _KitchenPageState();
}

class _KitchenPageState extends State<KitchenPage> {  
  AuthViewModel account =  locator<AuthViewModel>();
  KitchenViewModel kitchen =  locator<KitchenViewModel>();
  var items = List<Kitchen>();

   @override
   void initState() { 
     //locator<KitchenViewModel>().fetchKitchen();
     items.addAll(kitchen.itemListing);
     super.initState();
     
   }

   
  @override
  Widget build(BuildContext context) {
  return ScopedModelDescendant<KitchenViewModel>(
          builder: (context,child,model){
            return Scaffold(
                resizeToAvoidBottomPadding: false,
                appBar: homebar(context,Constant.kitchenLabel,account.userProfile.avatar),
                body: kitchenTable(context,items,filterSearchResults),
                //bottomNavigationBar:bottomNavBar(context,0),
       );
   }
  );  
}

void filterSearchResults(String query) {
  List<Kitchen> kitchenSearchList = kitchen.itemListing;
  if(query.isNotEmpty) {
    List<Kitchen> searchedListData = List<Kitchen>();

    kitchenSearchList.forEach((item) {
      if(item.title.toLowerCase().contains(query)) {
        searchedListData.clear();
        searchedListData.add(item);
      }
    });
    setState(() {
      items.clear();
      items.addAll(searchedListData);
    });
    return;
  } else {
    setState(() {
      items.clear();
      items.addAll(kitchen.itemListing);
    });
  }
}

}


  