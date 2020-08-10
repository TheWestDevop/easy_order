part of 'home.dart';

class HomePage extends StatefulWidget {
  HomePage(this.user);
  final Profile user;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1;
  final List<Widget> _children = [
    //Orders(),
    //  Kitchens(),
    Products(),
    HomeScreen(),
    SearchChef(),
    //  Chat() // create the pages you want to navigate between
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        key: _scaffoldKey,
        drawer: Drawer(child: leftDrawerMenu(widget.user, context)),
        appBar: buildAppBar(context, _scaffoldKey),
        body: _children[_currentIndex],
        bottomNavigationBar: CurvedNavigationBar(
            color: Constant.getColor("1b4332"),
            backgroundColor: Colors.white,
            buttonBackgroundColor: Constant.getColor("1b4332"),
            items: <Widget>[
              //Icon(Icons.local_mall,color:Colors.white,),
              // Icon(Icons.kitchen,color:Colors.white,),
              Icon(
                Icons.add_shopping_cart,
                color: Colors.white,
              ),
              Icon(
                Icons.home,
                color: Colors.white,
              ),
              Icon(
                Icons.fastfood,
                color: Colors.white,
              ),
              // Icon(Icons.question_answer,color:Colors.white,),
            ],
            index: this._currentIndex,
            onTap: (int index) {
              setState(() {
                this._currentIndex = index;
              });
            })
            );
  }
}
