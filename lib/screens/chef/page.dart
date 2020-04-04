part of 'chef.dart';


class ChefsPage extends StatefulWidget {

  @override
  _ChefsPageState createState() => _ChefsPageState();
}

class _ChefsPageState extends State<ChefsPage> {  

  @override
  Widget build(BuildContext context) {

   AuthViewModel account =  locator<AuthViewModel>();

   return new Scaffold(
              resizeToAvoidBottomPadding: false,
              appBar: homebar(context,Constant.chefsLabel,account.userProfile.avatar),
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
                            child:Text('List of Avaliable chefs'),
                          )
                         
                         ],
                      ),
                  ),
                  ]
                  )
                ],
              ),
              //bottomNavigationBar: bottomNavBar(context,3),
     );    
  }
}


  