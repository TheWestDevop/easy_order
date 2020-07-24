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
                  categories: [
                    {"id": 1, "icon": 'https://img.icons8.com/color/48/000000/food-donor.png', "title": 'All'},
                    {"id": 2, "icon": 'https://img.icons8.com/color/48/000000/grains-of-rice.png', "title": 'Grains'},
                    {"id": 3, "icon": 'https://img.icons8.com/color/48/000000/sweet-potato.png', "title": 'Tubers'},
                    {"id": 4, "icon": 'https://img.icons8.com/color/48/000000/paprika.png', "title": "Peppers"},
                    {
                      "id": 5,
                      "icon": 'https://img.icons8.com/offices/48/000000/pepper-shaker.png',
                      "title": "Spices",
                    },
                    {"id": 6, "icon": 'https://img.icons8.com/ios/48/000000/grass.png', "title": 'Cereals'},
                    {"id": 7, "icon": 'https://img.icons8.com/color/48/000000/group-of-fruits.png', "title": 'Fruits'},
                    {"id": 8, "icon": 'https://img.icons8.com/color/48/000000/group-of-vegetables.png', "title": 'Vegetables'},
                    {"id": 9, "icon": 'https://img.icons8.com/color/48/000000/olive-oil.png', "title": 'Oils'}
                  ],
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
                          // onTap: () => ,
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
                buildTrending(productViewModel.products),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "Best Package",
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            print("Clicked");
                          },
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
                buildTrending(productViewModel.products),
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
