import 'package:easy_order/services/services.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:easy_order/viewModel/CartViewModel.dart';
import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

Widget yourPicture(){
 return Container(
          child:Stack(
            children: <Widget>[
             Container(
              padding: EdgeInsets.fromLTRB(15.0,110.0,0.0,0.0),
              child: Text(
                'Your',
                style:TextStyle(
                  fontSize:80.0,fontWeight:FontWeight.bold)
                ),
              ),
              Container(
              padding: EdgeInsets.fromLTRB(15.0,175.0,0.0,0.0),
              child: Text(
                'Picture',
                style:TextStyle(
                  fontSize:80.0,fontWeight:FontWeight.bold)
                ),
              ),
              Container(
              padding: EdgeInsets.fromLTRB(168.0,130.0,0.0,0.0),
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

Widget appBarField(context,String route,String title){
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
                                onTap:()=> Navigator.of(context).pushNamed(route), //:  null,
                                  child: Center( 
                                    child:Icon(Icons.arrow_back_ios,size: 40,color: Colors.deepPurple,)
                                  ),
                                ),
                  Text(title,style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold,color: Colors.deepPurple),),
                  Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: GestureDetector(
                                onTap:()=> Navigator.of(context).pushNamed('/cart'), //:  null,
                                  child: Center(
                                    child:Icon(Icons.shopping_cart,size: 40,color: Colors.deepPurple,),
                                  ),
                                )
              ),
              Positioned(
                child: ScopedModelDescendant<CartViewModel>(
                builder: (context,child,model){
                    return Container(
                      child: Text((model.cartListing.length > 0) ? model.cartListing.length.toString() : "",textAlign: TextAlign.center,style: TextStyle(color: Colors.pink,fontWeight: FontWeight.bold),),
                    );
                  },
                ),
                ),
            ],
          )
                ],
              ),
            ),
          ),
        ),
      );
}

Widget nextBtn(context,String route,){

  return Container(
                                height:55.0,
                                child:Material(
                                borderRadius:BorderRadius.circular(20.0),
                                shadowColor:Colors.deepPurpleAccent,
                                color:Colors.deepPurple,
                                elevation:7.0,
                                child:GestureDetector(
                                onTap:()=> Navigator.of(context).pushNamed(route), //:  null,
                                  child: Center( 
                                    child:Text(
                                      Constant.nextLabel,
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

             


