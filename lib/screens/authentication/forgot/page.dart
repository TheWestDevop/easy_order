part of 'forgot.dart';

class Forgot_Page extends StatefulWidget {
  @override
  _Forgot_PageState createState() => _Forgot_PageState();
}

class _Forgot_PageState extends State<Forgot_Page> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: authAppBarField(context,''),
     body: Column(
       crossAxisAlignment: CrossAxisAlignment.stretch,
       children:<Widget>[
        //SizedBox(height:20.0,),
        forgotPasswordLabel(),
        SizedBox(height:40.0,),
        forgotPasswordField()
        ]
     ),
    );
  }
}