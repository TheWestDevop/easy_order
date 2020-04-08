part of 'chef.dart';


class ChefsPage extends StatefulWidget {

  @override
  _ChefsPageState createState() => _ChefsPageState();
}

class _ChefsPageState extends State<ChefsPage> {  
AuthViewModel account =  locator<AuthViewModel>();
  ChefViewModel chef =  locator<ChefViewModel>();
  var items = List<Chef>();

   @override
   void initState() { 
     //locator<ChefViewModel>().fetchChef();
     items.addAll(chef.itemListing);
     super.initState();
     
   }

   
  @override
  Widget build(BuildContext context) {
  return ScopedModelDescendant<ChefViewModel>(
          builder: (context,child,model){
            return Scaffold(
                resizeToAvoidBottomPadding: false,
                appBar: homebar(context,Constant.chefLabel,account.userProfile.avatar),
                body: chefTable(context,items,filterSearchResults),
                //bottomNavigationBar:bottomNavBar(context,0),
       );
   }
  );  
}

void filterSearchResults(String query) {
  List<Chef> chefSearchList = chef.itemListing;
  if(query.isNotEmpty) {
    List<Chef> searchedListData = List<Chef>();

    chefSearchList.forEach((item) {
      if(item.experience.toLowerCase().contains(query) || item.name.toLowerCase().contains(query)) {
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
      items.addAll(chef.itemListing);
    });
  }
}
}


  