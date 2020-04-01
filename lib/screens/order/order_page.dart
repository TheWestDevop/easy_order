part of 'order.dart';


class OrderForm extends StatefulWidget {


  @override
  _OrderFormState createState() => _OrderFormState();
}

class _OrderFormState extends State<OrderForm> {  

  @override
  Widget build(BuildContext context) {

   final bloc = Provider.of<HomeBloc>(context);

   return new Scaffold(
              resizeToAvoidBottomPadding: false,
              appBar: appBarField(context,'/',Constant.orderLabel),
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
                          // storeField(bloc),
                          // SizedBox(height:20.0),
                          noteField(),
                          SizedBox(height:40.0,),
                          nextBtn(context,'/place_order'),
                          //SizedBox(height:20.0,),
                          //loginUsePhone(context),
                          //SizedBox(height:20.0,),
                          //registerLink(context)
                         ],
                      ),
                  ),
                  ]
                  )
                ],
              ),
     );    
  }
}


  