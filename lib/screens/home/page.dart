part of 'home.dart';

class HomeScreenPage extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreenPage> {
  ProductViewModel productViewModel;
  // var  _profile = Profile;

  @override
  void initState() {
    productViewModel = locator<ProductViewModel>();
    super.initState();
  }

  final List<dynamic> imgList = [
    {
      "heading": "header one",
      "description": "nothing really for now",
      "url":
          'https://images.unsplash.com/photo-1534452203293-494d7ddbf7e0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1352&q=80'
    },
    {
      "heading": "header two",
      "description": "nothing really for now",
      "url":
          'https://images.unsplash.com/photo-1513884923967-4b182ef167ab?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80'
    },
    {
      "heading": "header three",
      "description": "nothing really for now",
      "url":
          'https://images.unsplash.com/photo-1513885535751-8b9238bd345a?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80'
    },
    {
      "heading": "header four",
      "description": "nothing really for now",
      "url":
          'https://images.unsplash.com/photo-1483985988355-763728e1935b?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80'
    },
    {
      "heading": "header five",
      "description": "nothing really for now",
      "url":
          'https://images.unsplash.com/photo-1487412912498-0447578fcca8?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80'
    },
    {
      "heading": "header six",
      "description": "nothing really for now",
      "url":
          'https://images.unsplash.com/photo-1526178613552-2b45c6c302f0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80'
    },
    {
      "heading": "header seven",
      "description": "nothing really for now",
      "url":
          'https://images.unsplash.com/photo-1472417583565-62e7bdeda490?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      //appBar: homebar(context, Constant.homelabel),
      body: ListView(scrollDirection: Axis.vertical, children: <Widget>[
        Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                CategoriesListView(
                  categories: productViewModel.categories,
                ),
                buildCarouselSlider(imgList),
                SizedBox(
                  height: 5.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "Popular Trendings",
                          style: TextStyle(
                              fontFamily: 'FontAwesome5Solid',
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => Navigator.of(context)
                              .pushNamed("/featured/product",arguments:[productViewModel.demo_products,"Popular Trendings"]),
                          child: Text(
                            "View all",
                            style: TextStyle(
                                fontSize: 12.0,
                                fontFamily: 'FontAwesome5Solid',
                                fontWeight: FontWeight.bold,
                                color: Colors.green[900]),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                buildTrending(productViewModel.demo_products),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "Upcoming Products",
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () =>
                              Navigator.of(context)
                              .pushNamed("/upcoming/product",arguments:[productViewModel.demo_upcoming_products,"Upcoming Products"]),
                          child: Text(
                            "View all",
                            style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[900]),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                buildUpcoming(productViewModel.demo_upcoming_products),
                // Occasions(),
                // Occasions(),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
