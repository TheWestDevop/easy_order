part of 'product.dart';

class ProductView extends StatefulWidget {
  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final productViewModel = locator<ProductViewModel>();


  var account;
  var items = List<Product>();

  @override
  void initState() {
    items.addAll(productViewModel.products);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProductViewModel>(
        builder: (context, child, model) {
      return Scaffold(
        resizeToAvoidBottomPadding: false,
       // appBar: homebar(context, Constant.avaliableProduct),
        body: productTable(context, items, filterSearchResults),
        //bottomNavigationBar:bottomNavBar(context,0),
      );
    });
  }

  void filterSearchResults(String query) {
    List<Product> productSearchList = productViewModel.products;
    if (query.isNotEmpty) {
      List<Product> searchedListData = List<Product>();

      productSearchList.forEach((item) {
        if (item.title.toLowerCase().contains(query)) {
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
        items.addAll(productViewModel.products);
      });
    }
  }

  
}
