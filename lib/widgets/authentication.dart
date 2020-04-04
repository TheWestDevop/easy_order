
import 'package:easy_order/shared/shared.dart';
import 'package:easy_order/widgets/widget.dart';
import 'package:flutter/material.dart';



Widget phoneField(){
  return TextFormField(
                            validator:(val)=>validatePhoneField(val),
                            decoration:InputDecoration(
                            prefixIcon: Icon(Icons.phone,color:Colors.deepPurple[900]),
                            labelText: Constant.phonePlaceholder,
                            labelStyle: TextStyle(
                              fontFamily:'Montserrat',
                              fontWeight:FontWeight.bold,
                              color:Colors.grey,
                            ),
                            focusedBorder: OutlineInputBorder(borderSide:BorderSide(color:Colors.deepPurple[900]) ),
                            //errorText: snapshot.error,
                            ),
                            
                           // onChanged: bloc.changeUserPhone
                          );
                        }
                    
Widget nameField(){
  return TextFormField(     
                            validator:(val)=>validateNameField(val),
                            decoration:InputDecoration(
                            prefixIcon: Icon(Icons.person,color:Colors.deepPurple[900]),
                            labelText: Constant.namePlaceholder,
                            labelStyle: TextStyle(
                              fontFamily:'Montserrat',
                              fontWeight:FontWeight.bold,
                              color:Colors.grey,
                            ),
                            focusedBorder: OutlineInputBorder(borderSide:BorderSide(color:Colors.deepPurple[900]) ),
                           // errorText: snapshot.error,
                            ),
                            
                            //onChanged: bloc.changeUserName
                          );
                        }
                      
Widget addressField(){
  return TextFormField(     
                            validator:(val)=>validateAddressField(val),
                            decoration:InputDecoration(
                            prefixIcon: Icon(Icons.location_on,color:Colors.deepPurple[900]),
                            labelText: Constant.addressPlaceholder,
                            labelStyle: TextStyle(
                              fontFamily:'Montserrat',
                              fontWeight:FontWeight.bold,
                              color:Colors.grey,
                            ),
                            focusedBorder: OutlineInputBorder(borderSide:BorderSide(color:Colors.deepPurple[900]) ),
                            //errorText: snapshot.error,
                            ),
                            
                            //onChanged: bloc.changeUserAddress
                          );
                        }
                      
Widget noteField(){
  return TextFormField( 
                            decoration:InputDecoration(
                            border:OutlineInputBorder(borderSide:BorderSide(color:Colors.deepPurple[900]) ),
                            helperText: "List of product and quantity",
                            prefixIcon: Icon(Icons.shopping_cart,color:Colors.deepPurple[900]),
                            labelText: Constant.orderListPlaceholder,
                            labelStyle: TextStyle(
                              fontFamily:'Montserrat',
                              fontWeight:FontWeight.bold,
                              color:Colors.grey,
                            ),
                            focusedBorder: OutlineInputBorder(borderSide:BorderSide(color:Colors.deepPurple[900]) ),
                            //errorText: snapshot.error,
                            ),
                           // onChanged: bloc.changeUserNote,
                            maxLines: 25
                          );
                        }

Widget loginUsePhone(context){
  return Container(
                        height:55.0,
                        child:Container(
                        decoration: BoxDecoration(
                          border:Border.all(
                            color: Colors.black,
                            style:BorderStyle.solid,
                            width: 1.0,
                            ),
                            color:Colors.transparent,
                            borderRadius:BorderRadius.circular(20.0),
                          ),
                          child:GestureDetector(
                            onTap:()=>Navigator.of(context).pushNamed('/phone'),
                            child: Row(
                              mainAxisAlignment:MainAxisAlignment.center,
                              children:<Widget>[
                                //SizedBox(width:70.0,),
                                Container(
                                  child:Icon(
                                    Icons.phone,
                                    color: Colors.black,
                                    size: 20.0,
                                  ),
                                ),
                                SizedBox(width:10.0,),
                                Container(
                                  child:Text(
                                    Constant.loginWithPhoneBtn,
                                    style: TextStyle(
                                      //height:2.0,
                                      color:Colors.black,
                                      fontWeight:FontWeight.bold,
                                      fontFamily: 'Montserrat',
                                      fontSize:20,
                                    ),)
                                ),
                            ]
                            )
                        )
                      )
  );
}

Widget registerLink(context){
  return  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          Constant.newUserlabel,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily:'Montserrat'
                          ),
                        ),
                        SizedBox(width:5.0,),
                        InkWell(
                        onTap:()=>Navigator.of(context).pushNamed('/register'),
                        child:Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(Constant.registerLabel,
                            style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Montserrat', color: Colors.deepPurple[900])),
                            
                          ),
                      ),
                      ],
                      );                   
}

Widget loginHeader(){
 return Container(
          child:Stack(
            children: <Widget>[
             Container(
              padding: EdgeInsets.fromLTRB(15.0,110.0,0.0,0.0),
              child: Text(
                'Hello',
                style:TextStyle(
                  fontSize:80.0,fontWeight:FontWeight.bold)
                ),
              ),
              Container(
              padding: EdgeInsets.fromLTRB(15.0,175.0,0.0,0.0),
              child: Text(
                'There',
                style:TextStyle(
                  fontSize:80.0,fontWeight:FontWeight.bold)
                ),
              ),
              Container(
              padding: EdgeInsets.fromLTRB(220.0,175.0,0.0,0.0),
              child: Text(
                '.',
                style:TextStyle(
                  fontSize:80.0,fontWeight:FontWeight.bold,color:Colors.deepPurple[900])
                ),
              ),

          ],
          )
        );
}

Widget pictureField(context){
  return Container(
    child:Center(child: Text("Picture is needed security purpose")),
  );
}

Widget displayPictureField(context){
  return Container(
    child:Center(child: Text("Picture is here")),
  );
}


                      

Widget registerBtn(){
  return Container(
                 height:55.0,
                 child:Material(
                borderRadius:BorderRadius.circular(20.0),
                shadowColor:Colors.deepPurple[900],
                color:Colors.deepPurple[900],
                elevation:7.0,
                child:GestureDetector(
                  onTap:(){},
                  child: Center(
                    child:Text(
                      Constant.registerBtn,
                      style: TextStyle(
                        //height:2.0,
                        color:Colors.white,
                        fontWeight:FontWeight.bold,
                        fontFamily: 'Montserrat',
                        fontSize:25,
                      ),)
                  ),)
               )
               );
}

Widget forgotBtn(context){
  return InkWell(
                        onTap:()=>Navigator.of(context).pushNamed('/forgot'),
                        child:Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(Constant.forgot_password,
                            style: TextStyle(fontWeight: FontWeight.w900, fontFamily: 'Montserrat', color: Colors.deepPurple[900])),
                            
                          ),
                          ),
                      );
}


Widget oldUser(context){
  return Row(
                mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 Text(
                   Constant.oldUserlabel,
                   style: TextStyle(
                     fontWeight: FontWeight.bold, 
                     fontFamily:'Montserrat'
                   ),
                 ),
                 SizedBox(width:5.0,),
                 InkWell(
                onTap:()=>Navigator.of(context).pushNamed('/login'),
                child:Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(Constant.loginLabel,
                    style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Montserrat', color: Colors.deepPurple[900])),
                    
                  ),
              ),
               ],
              );
}

Widget otpField(context){
  return  Container(
          padding: EdgeInsets.only(top:35,left:20.0,right:20.0),
          child: Column(
            children:<Widget>[
              TextFormField(
                validator:(val)=>validateStringField(val),
                decoration:InputDecoration(
                 labelText: Constant.otpPlaceholder,
                 labelStyle: TextStyle(
                   fontFamily:'Montserrat',
                   fontWeight:FontWeight.bold,
                   color:Colors.grey,
                 ),
                 focusedBorder: UnderlineInputBorder(borderSide:BorderSide(color:Colors.deepPurple[900]) )
                )
              ),
              SizedBox(height:40.0,),
               Container(
                 height:55.0,
                 child:Material(
                borderRadius:BorderRadius.circular(20.0),
                shadowColor:Colors.deepPurple[900],
                color:Colors.deepPurple[900],
                elevation:7.0,
                child:GestureDetector(
                  onTap:(){},
                  child: Center(
                    child:Text(
                      Constant.verifyOTPLabel,
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
              SizedBox(height:20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 Text(
                   Constant.goBackLabel,
                   style: TextStyle(
                     fontWeight: FontWeight.bold, 
                     fontFamily:'Montserrat'
                   ),
                 ),
                 SizedBox(width:5.0,),
                 InkWell(
                onTap:()=>Navigator.of(context).pushNamed('/'),
                child:Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(Constant.loginLabel,
                    style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Montserrat', color: Colors.deepPurple[900])),
                    
                  ),
              ),
               ],
              ),
            ],
          ),
        );
       
}

Widget phoneAuthLabel(){
  return Container(
          child:Stack(
            children: <Widget>[
             Container(
              padding: EdgeInsets.fromLTRB(15.0,110.0,0.0,0.0),
              child: Text(
                'Phone Number',
                style:TextStyle(
                  fontSize:50.0,fontWeight:FontWeight.bold)
                ),
              ),
              Container(
              padding: EdgeInsets.fromLTRB(15.0,175.0,0.0,0.0),
              child: Text(
                'Verification',
                style:TextStyle(
                  fontSize:40.0,fontWeight:FontWeight.bold)
                ),
              ),
              Container(
              padding: EdgeInsets.fromLTRB(210.0,50.0,0.0,0.0),
              child: Text(
                '.',
                style:TextStyle(
                  fontSize:80.0,fontWeight:FontWeight.bold,color:Colors.deepPurple[900])
                ),
              ),

          ],
          )
        );
        
}

Widget signUpLabel(){
  return  Container(
          child:Stack(
            children: <Widget>[
              Container(
              padding: EdgeInsets.fromLTRB(15.0,50.0,0.0,0.0),
              child: Text(
                'Sign',
                style:TextStyle(
                  fontSize:80.0,fontWeight:FontWeight.bold)
                ),
              ),
              Container(
              padding: EdgeInsets.fromLTRB(15.0,115.0,0.0,0.0),
              child: Text(
                'Up',
                style:TextStyle(
                  fontSize:80.0,fontWeight:FontWeight.bold)
                ),
              ),
              Container(
              padding: EdgeInsets.fromLTRB(69.0,145.0,0.0,0.0),
              child: Text(
                '.',
                style:TextStyle(
                  fontSize:80.0,fontWeight:FontWeight.bold,color:Colors.deepPurple[900])
                ),
              ),

          ],
          )
        );
}          

Widget otpLabel(){
  return Container(
          child:Stack(
            children: <Widget>[
             Container(
              padding: EdgeInsets.fromLTRB(15.0,110.0,0.0,0.0),
              child: Text(
                'OTP',
                style:TextStyle(
                  fontSize:60.0,fontWeight:FontWeight.bold)
                ),
              ),
              Container(
              padding: EdgeInsets.fromLTRB(15.0,175.0,0.0,0.0),
              child: Text(
                'Verification',
                style:TextStyle(
                  fontSize:60.0,fontWeight:FontWeight.bold)
                ),
              ),
              Container(
              padding: EdgeInsets.fromLTRB(26.0,76.0,0.0,0.0),
              child: Text(
                '.',
                style:TextStyle(
                  fontSize:80.0,fontWeight:FontWeight.bold,color:Colors.deepPurple[900])
                ),
              ),

          ],
          )
        );
}

Widget authAppBarField(context,String title){
  return  PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(
              color: Colors.transparent,
              spreadRadius: 5,
              blurRadius: 2
            )]
          ),
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
            ),
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                                onTap:()=> Navigator.of(context).pop(), //:  null,
                           
                                    child:Icon(Icons.arrow_back,size: 40,color: Colors.deepPurple[900],)
                                  ),
                  Text("Avaliable Empty",style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold,color: Colors.transparent),),
                  Text('',style:TextStyle(fontSize: 30,fontWeight:FontWeight.bold,color: Colors.transparent),),
                ],
              ),
            ),
          ),
        ),
      );
}

Widget phoneAuthField(context){
  return  Container(
          padding: EdgeInsets.only(top:35,left:20.0,right:20.0),
          child: Column(
            children:<Widget>[
              TextFormField(
                validator:(val)=>validatePhoneField(val),
                decoration:InputDecoration(
                  prefixIcon: Icon(Icons.phone_iphone,color:Colors.deepPurple[900]),
                 labelText: Constant.phonePlaceholder,
                 labelStyle: TextStyle(
                   fontFamily:'Montserrat',
                   fontWeight:FontWeight.bold,
                   color:Colors.grey,
                 ),
                 focusedBorder: OutlineInputBorder(borderSide:BorderSide(color:Colors.deepPurple[900]) )
                )
              ),
              SizedBox(height:40.0,),
               Container(
                 padding: const EdgeInsets.fromLTRB(35.0,0,35.0,0),
                 height:55.0,
                 child:Material(
                borderRadius:BorderRadius.circular(20.0),
                shadowColor:Colors.deepPurple[900],
                color:Colors.deepPurple[900],
                elevation:7.0,
                child:GestureDetector(
                  onTap:()=>Navigator.of(context).pushNamed('/otp'),
                  child: Center(
                    child:Text(
                      Constant.sendOTPPlaceholder,
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
              SizedBox(height:20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 Text(
                   Constant.goBackLabel,
                   style: TextStyle(
                     fontWeight: FontWeight.bold, 
                     fontFamily:'Montserrat'
                   ),
                 ),
                 SizedBox(width:5.0,),
                 InkWell(
                onTap:()=>Navigator.of(context).pushNamed('/'),
                child:Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(Constant.loginLabel,
                    style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Montserrat', color: Colors.deepPurple[900])),
                    
                  ),
              ),
               ],
              ),
            ],
          ),
        );
       
}

Widget forgotPasswordLabel(){
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
              padding: EdgeInsets.fromLTRB(262.0,45.0,0.0,0.0),
              child: Text(
                '.',
                style:TextStyle(
                  fontSize:80.0,fontWeight:FontWeight.bold,color:Colors.deepPurple[900])
                ),
              ),

          ],
          )
        );
}

Widget forgotPasswordField(){
  return  Container(
          padding: EdgeInsets.only(top:35,left:20.0,right:20.0),
          child: Column(
            children:<Widget>[
              TextFormField(
                validator:(val)=>validateEmailField(val),
                decoration:InputDecoration(
                  prefixIcon: Icon(Icons.email,color:Colors.deepPurple[900]),
                 labelText: Constant.emailPlaceholder,
                 labelStyle: TextStyle(
                   fontFamily:'Montserrat',
                   fontWeight:FontWeight.bold,
                   color:Colors.grey,
                 ),
                 focusedBorder: UnderlineInputBorder(borderSide:BorderSide(color:Colors.deepPurple[900]) )
                )
              ),
              SizedBox(height:40.0,),
               Container(
                 height:55.0,
                 child:Material(
                borderRadius:BorderRadius.circular(20.0),
                shadowColor:Colors.deepPurple[900],
                color:Colors.deepPurple[900],
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












