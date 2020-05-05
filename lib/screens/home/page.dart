part of 'home.dart';

class HomeScreenPage extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreenPage> {
   final user = locator<AccountViewModel>();
  //final GlobalKey<FormState>  _globalKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
     resizeToAvoidBottomPadding: false,
     appBar: homebar(context,Constant.homelabel,user.profile.avatar),
     body:ListView(
     scrollDirection: Axis.vertical,
     children:<Widget>[ 
       Center(child: Text("Home Page",style:TextStyle(color: Colors.black)))
     ]),
    );
  }



}