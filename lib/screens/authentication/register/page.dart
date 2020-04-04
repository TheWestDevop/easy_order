part of 'register.dart';

class Register_Page extends StatefulWidget {
  @override
  Register_PageState createState() => Register_PageState();
}

class Register_PageState extends State<Register_Page> {
  String _email;
  String _password;

  final GlobalKey<FormState>  _globalKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
     appBar: authAppBarField(context,''),
     body:ListView(
     scrollDirection: Axis.vertical,
     children:<Widget>[ 
       Form(
            key: _globalKey,
            child: Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
         children:<Widget>[
          
          signUpLabel(),
          SizedBox(height:10.0,),
          Padding(
            padding: const EdgeInsets.fromLTRB(25.0,0,25.0,0),
            child: nameField(),
          ),
          SizedBox(height:20.0),
          Padding(
            padding: const EdgeInsets.fromLTRB(25.0,0,25.0,0),
            child: emailField(),
          ),
          SizedBox(height:20.0),
          Padding(
            padding: const EdgeInsets.fromLTRB(25.0,0,25.0,0),
            child: phoneField(),
          ),
          SizedBox(height:20.0),
          Padding(
            padding: const EdgeInsets.fromLTRB(25.0,0,25.0,0),
            child: addressField(),
          ),
          SizedBox(height:20.0,),
          Padding(
            padding: const EdgeInsets.fromLTRB(25.0,0,25.0,0),
            child: passwordField(),
          ),
          SizedBox(height:40.0,),
          Padding(
            padding: const EdgeInsets.fromLTRB(35.0,0,35.0,0),
            child: registerBtn(),
          ),
          SizedBox(height:20.0),
          oldUser(context)
          ]
       ),
     ),
     ]),
    );
  }

Widget emailField(){
     return TextFormField(
                                      validator:(val)=>validateEmailField(val),
                                      onSaved:(String val){
                                        _email = val;
                                      },
                                      decoration:InputDecoration(
                                        prefixIcon: Icon(Icons.email,color:Colors.deepPurple[900]),
                                        labelText: Constant.emailPlaceholder,
                                        labelStyle: TextStyle(
                                          fontFamily:'Montserrat',
                                          fontWeight:FontWeight.bold,
                                          color:Colors.grey,
                                        ),
                                        focusedBorder: OutlineInputBorder(borderSide:BorderSide(color:Colors.deepPurple[900]) ),
                                        //errorText: snapshot.error,
                                        ),
                                      //onChanged: bloc.changeUserEmail,
                                );
                        }

Widget passwordField(){
  return TextFormField(
                            validator:(val)=>validatePasswordField(val),
                            onSaved:(String val){
                              _password = val;
                            },
                            decoration:InputDecoration(
                            prefixIcon: Icon(Icons.lock,color:Colors.deepPurple[900]),
                            labelText: Constant.passwordPlaceholder,
                            labelStyle: TextStyle(
                              fontFamily:'Montserrat',
                              fontWeight:FontWeight.bold,
                              color:Colors.grey,
                            ),
                            focusedBorder: OutlineInputBorder(borderSide:BorderSide(color:Colors.deepPurple[900]) ),
                            //errorText: snapshot.error,
                            ),
                            obscureText:true,
                            //onChanged: bloc.changeUserPassword
                          );
                        }

 Widget loginBtn(context){

  return ScopedModelDescendant<AuthViewModel>(
                builder: (context,child,authViewModel){
                   return Container(
                            height:55.0,
                            child:Material(
                            borderRadius:BorderRadius.circular(20.0),
                            shadowColor:Colors.deepPurple[900],
                            color:Colors.deepPurple[900],
                            elevation:7.0,
                            child:GestureDetector(
                            onTap:(){
                              if (!_globalKey.currentState.validate()) {
                                return;
                              } else {
                                _globalKey.currentState.save();
                                print("email :- $_email and password :- $_password");
                                //authViewModel.loginUser(context,email,password);
                              }
                              
                            },
                            child: Row(
                              mainAxisAlignment:MainAxisAlignment.center,
                              children:<Widget>[
                                Container(
                                  child:Text(
                                    Constant.loginBtn,
                                    style: TextStyle(
                                      //height:2.0,
                                      color:Colors.white,
                                      fontWeight:FontWeight.bold,
                                      fontFamily: 'Montserrat',
                                      fontSize:20,
                                    ),)
                                ),
                                 SizedBox(width:10.0,),
                                Container(
                                  child:Icon(
                                    Icons.shopping_basket,
                                    color: Colors.white,
                                    size: 20.0,
                                  ),
                                ),
                      
                                
                            ]
                            )
                        )
                            )
                          );
                });
  
    }
 

}