part of 'search_how_to.dart';

class SearchRecipes extends StatefulWidget {
  @override
  _SearchRecipesState createState() => _SearchRecipesState();
}

class _SearchRecipesState extends State<SearchRecipes> {
  final postViewModel = locator<RecipeViewModel>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String title = "Search Recipes";
  var items = List<Recipe>();
  
  @override
  void initState() {
    // items.addAll(postViewModel.posts);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<RecipeViewModel>(
        builder: (context, child, model) {
      return Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: pageAppBar(context, title),
             body: 
          Column(
            children: <Widget>[
              searchField(),
              SizedBox(height:15,),
              items.isEmpty ? Text("No Recipe Found",style:TextStyle(fontSize:20,color: Colors.grey[350]),) :
              Expanded(
                child: Container(
                                color: Colors.white38,
                                // height:MediaQuery.of(context).size.height,
                                child: ListView(
                                    shrinkWrap: true,
                                    // scrollDirection: Axis.vertical,
                                    children: items
                                        .map((post) =>
                                            generatePostList(post))
                                        .toList()),
              )),
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
              labelText: Constant.searchPosts,
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
    List<Recipe> postSearchList = postViewModel.posts;
    if (query.isNotEmpty) {
      List<Recipe> searchedListData = List<Recipe>();

      postSearchList.forEach((item) {
        if (item.title_header.toLowerCase().contains(query)) {
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
        // items.addAll(postViewModel.posts);
      });
    }
  }
}
