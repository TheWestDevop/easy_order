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
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 3;
    final double itemWidth = size.width / 2;

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
              items.isEmpty ? Text("No Product Found Yet",style:TextStyle(fontSize:15,color: Colors.grey[350]),) :
              Expanded(
                child: productsGrid(items,(itemWidth / itemHeight))
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
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(color: Colors.green)),
              suffixIcon: Icon(Icons.search, color: Colors.green[700]),
              labelText: Constant.searchPlaceholder,
              labelStyle: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(color: Colors.green))),
          onChanged: (val) => filterSearchResults(val)),
    );
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
        // items.addAll(productViewModel.products);
      });
    }
  }
}
