part of 'home.dart';


class HomePage extends StatefulWidget {

HomePage();

   @override
  _HomePageState createState() => _HomePageState();

  
}

class _HomePageState extends State<HomePage> {  

  
  int _currentIndex = 2;
  final List<Widget> _children = [ 
   //Orders(), 
   Kitchens(),
   Products(),
   HomeScreen(),
   Chefs(),
   Chat() // create the pages you want to navigate between
  ];
  
 
  @override
  Widget build(BuildContext context) {
   return new Scaffold(
              resizeToAvoidBottomPadding: false,
              body:_children[_currentIndex],
              bottomNavigationBar:CurvedNavigationBar( 
                    color: Colors.deepPurple[900],
                    backgroundColor:Colors.white,
                    buttonBackgroundColor:Colors.deepPurple[900],
                items:<Widget>[
                  //Icon(Icons.local_mall,color:Colors.white,),
                  Icon(Icons.kitchen,color:Colors.white,),
                  Icon(Icons.shopping_cart,color:Colors.white,),
                  Icon(Icons.home,color:Colors.white,),
                  Icon(Icons.people,color:Colors.white,),
                  Icon(Icons.question_answer,color:Colors.white,),
                  ],
                  index: this._currentIndex,
                  onTap: (int index) {
                      setState(() {
                        this._currentIndex = index;
                      });
                    }
                  )
                );    
  }
}


  