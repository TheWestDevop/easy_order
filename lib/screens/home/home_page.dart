part of 'home.dart';


class HomeForm extends StatefulWidget {


  @override
  _HomeFormState createState() => _HomeFormState();
}

class _HomeFormState extends State<HomeForm> {  

  @override
  Widget build(BuildContext context) {

   //final bloc = Provider.of<HomeBloc>(context);

   return new Scaffold(
              resizeToAvoidBottomPadding: false,
              body: ListView(
     scrollDirection: Axis.vertical,
     children:<Widget>[ 
                    Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:<Widget>[
                  loginHeader(),
                  Container(
                    padding: EdgeInsets.only(top:35,left:20.0,right:20.0),
                    child: Column(
                        children:<Widget>[
                          nameField(),
                          SizedBox(height:20.0),
                          emailField(),
                          SizedBox(height:20.0),
                          phoneField(),
                          SizedBox(height:20.0),
                          addressField(),
                          //SizedBox(height:10.0,),
                          //forgotBtn(context),
                          SizedBox(height:40.0,),
                          nextBtn(context,'/products'),
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


  