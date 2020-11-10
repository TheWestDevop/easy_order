part of 'search.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  Profile user;
  final productViewModel = locator<ProductViewModel>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String title = "Search Products";
  var items = List<Product>();
  
  @override
  void initState() {
    // items.addAll(productViewModel.products);
    user = locator<AccountViewModel>().profile;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProductViewModel>(
        builder: (context, child, model) {
      return Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: pageAppBar(context, title),
             body: 
          Column(
            children: <Widget>[
              searchField(),
              SizedBox(height:15,),
              items.isEmpty ? Text("No Product Found",style:TextStyle(fontSize:20,color: Colors.grey[350]),) :
              Expanded(
                child: productsGrid(items)
             )
            ]),
          );
    });
  }

  Widget searchField() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
          decoration: InputDecoration(
              border: UnderlineInputBorder(
                 // borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(color: Constant.getColor("1b4332"))),
              suffixIcon: Icon(Icons.search, color: Constant.getColor("1b4332")),
              labelText: Constant.searchPlaceholder,
              labelStyle: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
              focusedBorder: UnderlineInputBorder(
                  //borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(color: Constant.getColor("1b4332")))),
          onChanged: (val) => filterSearchResults(val)),
    );
  }

  void filterSearchResults(String query) {
    List<Product> productSearchList = productViewModel.demo_products;
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
        // items.addAll(productViewModel.products);
      });
    }
  }
}
