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
  forgotPasswordField(){
  return  Container(
          padding: EdgeInsets.only(top:35,left:20.0,right:20.0),
          child: Column(
            children:<Widget>[
              TextFormField(
                validator:(val)=>validateEmailField(val),
                decoration:InputDecoration(
                  prefixIcon: Icon(Icons.email,color:Constant.getColor("1b4332")),
                 labelText: Constant.emailPlaceholder,
                 labelStyle: TextStyle(
                   fontFamily:'Montserrat',
                   fontWeight:FontWeight.bold,
                   color:Colors.grey,
                 ),
                 focusedBorder: UnderlineInputBorder(borderSide:BorderSide(color:Constant.getColor("1b4332")) )
                )
              ),
              SizedBox(height:40.0,),
               Container(
                 height:55.0,
                 child:Material(
                borderRadius:BorderRadius.circular(20.0),
                shadowColor:Constant.getColor("1b4332"),
                color:Constant.getColor("1b4332"),
                elevation:7.0,
                child:GestureDetector(
                  onTap:(){},
                  child: Center(
                    child:Text(
                      Constant.passwordResetlabel,
                      style: TextStyle(
                        //height:2.0,
                        color:Colors.white,
                        fontWeight:FontWeight.bold,
                        fontFamily: 'Montserrat',
                        fontSize:25,
                      ),)
                  ),)
               )
               ),
             ],
          ),
        );
}

forgotPasswordLabel(){
  return  Container(
          child:Stack(
            children: <Widget>[
             Container(
              padding: EdgeInsets.fromLTRB(15.0,60.0,0.0,0.0),
              child: Text(
                'Password',
                style:TextStyle(
                  fontSize:80.0,fontWeight:FontWeight.bold)
                ),
              ),
              Container(
              padding: EdgeInsets.fromLTRB(15.0,125.0,0.0,0.0),
              child: Text(
                'Reset',
                style:TextStyle(
                  fontSize:80.0,fontWeight:FontWeight.bold)
                ),
              ),
              Container(
              padding: EdgeInsets.fromLTRB(223.0,10.0,0.0,0.0),
              child: Text(
                '.',
                style:TextStyle(
                  fontSize:80.0,fontWeight:FontWeight.bold,color:Constant.getColor("1b4332"))
                ),
              ),

          ],
          )
        );
}
}