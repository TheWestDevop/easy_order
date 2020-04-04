part of 'kitchen.dart';


class KitchenPage extends StatefulWidget {

  @override
  _KitchenPageState createState() => _KitchenPageState();
}

class _KitchenPageState extends State<KitchenPage> {  

  @override
  Widget build(BuildContext context) {

   AuthViewModel account =  locator<AuthViewModel>();

   return new Scaffold(
              resizeToAvoidBottomPadding: false,
              appBar: homebar(context,Constant.kitchenLabel,account.userProfile.avatar),
              body: ListView(
              scrollDirection: Axis.vertical,
              children:<Widget>[ 
                    Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:<Widget>[
                  Container(
                    padding: EdgeInsets.only(top:35,left:20.0,right:20.0),
                    child: Column(
                        children:<Widget>[
                          Center(
                            child:Text('List of Avaliable Kitchens'),
                          )
                         
                         ],
                      ),
                  ),
                  ]
                  )
                ],
              ),
              //bottomNavigationBar: bottomNavBar(context,2),
     );    
  }
}


  