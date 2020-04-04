
import 'package:easy_order/models/models.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:easy_order/viewModel/viewModel.dart';
import 'package:easy_order/widgets/widget.dart';
import 'package:flutter/material.dart';





Widget profilePicture(String img){
  return CircleAvatar(
                   child: ClipOval(
                  child: cacheImage(img),),
                  radius: 200/2,
                  );
}

Widget profileDetails(context,Profile profile){
  final authViewModel = locator<AuthViewModel>();
  return Container(
          child: Center(
              child:Column(
                children:<Widget>[
                  TextFormField(     
                            decoration:InputDecoration(
                            border:OutlineInputBorder(borderSide:BorderSide(color:Colors.deepPurple[900])),
                            prefixIcon: Icon(Icons.person,color:Colors.deepPurple[900]),
                            labelText: Constant.namePlaceholder,
                            labelStyle: TextStyle(
                              fontFamily:'Montserrat',
                              fontWeight:FontWeight.bold,
                              color:Colors.grey,
                            ),
                            ),
                            initialValue:profile.name,
                            enabled:false,
                            ),
                  SizedBox(height:20.0,),
                  TextFormField(
                            initialValue:profile.phone,
                            enabled:false,
                            decoration:InputDecoration(
                            border:OutlineInputBorder(borderSide:BorderSide(color:Colors.deepPurple[900])),
                            prefixIcon: Icon(Icons.phone,color:Colors.deepPurple[900]),
                            labelText: Constant.phonePlaceholder,
                            labelStyle: TextStyle(
                              fontFamily:'Montserrat',
                              fontWeight:FontWeight.bold,
                              color:Colors.grey,
                            ),
                           ),
                          ),
                  SizedBox(height:20.0,),
                  TextFormField(     
                            initialValue:profile.address,
                            enabled:false,
                            decoration:InputDecoration(
                            border:OutlineInputBorder(borderSide:BorderSide(color:Colors.deepPurple[900])),
                            prefixIcon: Icon(Icons.location_on,color:Colors.deepPurple[900]),
                            labelText: Constant.addressPlaceholder,
                            labelStyle: TextStyle(
                              fontFamily:'Montserrat',
                              fontWeight:FontWeight.bold,
                              color:Colors.grey,
                            ),
                            ),
                            
                          ),
                  SizedBox(height:20.0,),
                  TextFormField(
                    initialValue:profile.email,
                    enabled:false,
                     decoration:InputDecoration(
                     prefixIcon: Icon(Icons.email,color:Colors.deepPurple[900]),
                     labelText: Constant.emailPlaceholder,
                    labelStyle: TextStyle(
                        fontFamily:'Montserrat',
                        fontWeight:FontWeight.bold,
                        color:Colors.grey,
                        ),
                    ),
                    
                  ),
                  SizedBox(height:40.0,),
                  Container(
                    height:55.0,
                    child: Material(
                        borderRadius:BorderRadius.circular(20.0),
                        shadowColor:Colors.deepPurple[900],
                        color:Colors.deepPurple[900],
                        elevation:7.0,
                        child: RaisedButton(
                        color: Colors.deepPurple[900],
                        child:Row(
                                  mainAxisAlignment:MainAxisAlignment.center,
                                  children:<Widget>[
                                    Container(
                                      child:Text(
                                        Constant.logOutLabel,
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
                                        Icons.exit_to_app,
                                        color: Colors.white,
                                        size: 20.0,
                                      ),
                                    ),
                          
                                    
                                ]
                                ),
                        onPressed:(){
                            authViewModel.logOut(context);
                      }),
                    ),
                  )
                ]
              ),
          ),
  );
}


Widget accountAppBar(context,String title){
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
                                  child: Center( 
                                    child:Icon(Icons.arrow_back,size: 40,color: Colors.deepPurple[900],)
                                  ),
                                ),
                  Text(title,textAlign:TextAlign.center,style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold,color: Colors.deepPurple[900]),),
                  Text('----',style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold,color: Colors.transparent),),
    
                ],
              ),
            ),
          ),
        ),
      );
}
