import 'package:easy_order/bloc/bloc.dart';
import 'package:easy_order/models/models.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:easy_order/viewModel/viewModel.dart';
import 'package:flutter/material.dart';

Widget placeOrderBtn(context){
  return Container(
                            height:55.0,
                            child:Material(
                            borderRadius:BorderRadius.circular(20.0),
                            shadowColor:Colors.deepPurpleAccent,
                            color:Colors.deepPurple,
                            elevation:7.0,
                            child:GestureDetector(
                            //onTap:()=> snapshot.hasError  ? viewModel.error() : viewModel.place_order(data), //:  null,
                              child: Center( 
                                child:Text(
                                  Constant.placeOrderBtn,
                                  style: TextStyle(
                                    //height:2.0,
                                    color:Colors.white,
                                    fontWeight:FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                    fontSize:25,
                                  ),
                                )
                              ),
                            )
                            )
                          );
    }

Widget checkoutBottomNavigation(context,CartViewModel viewModel){
   return Container(
                         height:55.0,
                            child:Material(
                            borderRadius:BorderRadius.circular(20.0),
                            shadowColor:Colors.deepPurple,
                            color:Colors.deepPurple,
                            elevation:2.0,
                            child:RaisedButton(
                        color: Colors.deepPurple,
                        onPressed: (){
                          //viewModel.addCart(item);
                          Navigator.of(context).pushNamed('/place_order');
                        },
                        child: Text(Constant.checkoutLabel,style: TextStyle(
                                    //height:2.0,
                                    color:Colors.white,
                                    fontWeight:FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                    fontSize:25,
                                  ),),
                      )
                            )
          );
}

