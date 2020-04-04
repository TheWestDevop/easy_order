part of 'chat.dart';


class ChatPage extends StatefulWidget {

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {  

  @override
  Widget build(BuildContext context) {

   AuthViewModel account =  locator<AuthViewModel>();

   return new Scaffold(
              resizeToAvoidBottomPadding: false,
              appBar: homebar(context,Constant.chatLabel,account.userProfile.avatar),
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
                            child:Text('User and customer service chat'),
                          )
                         
                         ],
                      ),
                  ),
                  ]
                  )
                ],
              ),
              //bottomNavigationBar: bottomNavBar(context,4),
     );    
  }
}


  