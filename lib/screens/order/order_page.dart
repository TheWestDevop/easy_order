part of 'order.dart';


class OrderPage extends StatefulWidget {


  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {  

  @override
  Widget build(BuildContext context) {


   return new Scaffold(
              resizeToAvoidBottomPadding: false,
              // appBar: homebar(context,Constant.orderListPlaceholder),
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
                            child:Text('List of User Orders'),
                          )
                         
                         ],
                      ),
                  ),
                  ]
                  )
                ],
              ),
              //bottomNavigationBar: bottomNavBar(context,1),
     );    
  }
}


  