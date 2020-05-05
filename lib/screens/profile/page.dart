part of 'profile.dart';


class ProfilePage extends StatefulWidget {


  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {  

  @override
  Widget build(BuildContext context) {

   AccountViewModel account =  locator<AccountViewModel>();

   return new Scaffold(
              resizeToAvoidBottomPadding: false,
              appBar: accountAppBar(context,Constant.profileLabel),
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
                          //SizedBox(height:50.0,),
                          profilePicture(account.profile.avatar),
                          
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: profileDetails(context,account.profile),
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