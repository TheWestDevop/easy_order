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
     // appBar: authAppBar(context,''),
     body: Column(
       crossAxisAlignment: CrossAxisAlignment.stretch,
       children:<Widget>[
        //SizedBox(height:20.0,),
        forgotPasswordLabel(),
        SizedBox(height:40.0,),
        forgotPasswordField(),
        SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: oldUser(Constant.rememberPasswordlabel,context),
                )
        ]
     ),
    );
  }
}