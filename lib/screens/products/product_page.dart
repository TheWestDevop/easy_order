part of 'product.dart';


class ProductView extends StatefulWidget {
  
  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {  
   final profile = locator<AccountViewModel>();
   final product = locator<ProductViewModel>();
   var items = List<Product>();

   @override
   void initState() { 
     items.addAll(product.itemListing);
     super.initState();
     
   }

  
  
 
  

  @override
  Widget build(BuildContext context) {
  return ScopedModelDescendant<ProductViewModel>(
          builder: (context,child,model){
            return Scaffold(
                resizeToAvoidBottomPadding: false,
                appBar: homebar(context,Constant.avaliableProduct,profile.profile_image),
                body: productTable(context,items,filterSearchResults),
                //bottomNavigationBar:bottomNavBar(context,0),
       );
   }
  );  
}

void filterSearchResults(String query) {
  List<Product> productSearchList = product.itemListing;
  if(query.isNotEmpty) {
    List<Product> searchedListData = List<Product>();

    productSearchList.forEach((item) {
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
      items.addAll(product.itemListing);
    });
  }
}

}
