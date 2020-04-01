import 'package:easy_order/bloc/bloc.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:flutter/material.dart';

Widget emailField(){
return TextFormField(
                    
                                      decoration:InputDecoration(
                                        prefixIcon: Icon(Icons.email,color:Colors.deepPurple),
                                        labelText: Constant.emailPlaceholder,
                                        labelStyle: TextStyle(
                                          fontFamily:'Montserrat',
                                          fontWeight:FontWeight.bold,
                                          color:Colors.grey,
                                        ),
                                        focusedBorder: UnderlineInputBorder(borderSide:BorderSide(color:Colors.deepPurple) ),
                                        //errorText: snapshot.error,
                                        ),
                                      //onChanged: bloc.changeUserEmail,
                                );
                        }


Widget phoneField(){
  return TextFormField(
                            decoration:InputDecoration(
                            prefixIcon: Icon(Icons.phone,color:Colors.deepPurple),
                            labelText: Constant.phonePlaceholder,
                            labelStyle: TextStyle(
                              fontFamily:'Montserrat',
                              fontWeight:FontWeight.bold,
                              color:Colors.grey,
                            ),
                            focusedBorder: UnderlineInputBorder(borderSide:BorderSide(color:Colors.deepPurple) ),
                            //errorText: snapshot.error,
                            ),
                            
                           // onChanged: bloc.changeUserPhone
                          );
                        }
                    

Widget nameField(){
  return TextFormField(
                            decoration:InputDecoration(
                            prefixIcon: Icon(Icons.person,color:Colors.deepPurple),
                            labelText: Constant.namePlaceholder,
                            labelStyle: TextStyle(
                              fontFamily:'Montserrat',
                              fontWeight:FontWeight.bold,
                              color:Colors.grey,
                            ),
                            focusedBorder: UnderlineInputBorder(borderSide:BorderSide(color:Colors.deepPurple) ),
                           // errorText: snapshot.error,
                            ),
                            
                            //onChanged: bloc.changeUserName
                          );
                        }
                      


Widget addressField(){
  return TextFormField(
                            decoration:InputDecoration(
                            prefixIcon: Icon(Icons.location_on,color:Colors.deepPurple),
                            labelText: Constant.addressPlaceholder,
                            labelStyle: TextStyle(
                              fontFamily:'Montserrat',
                              fontWeight:FontWeight.bold,
                              color:Colors.grey,
                            ),
                            focusedBorder: UnderlineInputBorder(borderSide:BorderSide(color:Colors.deepPurple) ),
                            //errorText: snapshot.error,
                            ),
                            
                            //onChanged: bloc.changeUserAddress
                          );
                        }
                      


Widget noteField(){
  return TextFormField(
                            decoration:InputDecoration(
                            border:OutlineInputBorder(borderSide:BorderSide(color:Colors.deepPurple) ),
                            helperText: "List of product and quantity",
                            prefixIcon: Icon(Icons.shopping_cart,color:Colors.deepPurple),
                            labelText: Constant.orderListPlaceholder,
                            labelStyle: TextStyle(
                              fontFamily:'Montserrat',
                              fontWeight:FontWeight.bold,
                              color:Colors.grey,
                            ),
                            focusedBorder: OutlineInputBorder(borderSide:BorderSide(color:Colors.deepPurple) ),
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
                                    size: 30.0,
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
                            style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Montserrat', color: Colors.deepPurple)),
                            
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
                  fontSize:80.0,fontWeight:FontWeight.bold,color:Colors.deepPurple)
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
