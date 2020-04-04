
import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_order/models/models.dart';
import 'package:easy_order/services/services.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:easy_order/viewModel/viewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:scoped_model/scoped_model.dart';

Widget productTable(context,List<Product> product){
   var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 3;
    final double itemWidth = size.width / 2;
  return new Column(
        children: <Widget>[
          searchField(),
          new Expanded(
            child: productsGrid(product,(itemWidth / itemHeight))
        )
        ],
      );
}

Widget searchField(){
  return TextFormField(
                            decoration:InputDecoration(
                            prefixIcon: Icon(Icons.search,color:Colors.deepPurple[900]),
                            labelText: Constant.searchPlaceholder,
                            labelStyle: TextStyle(
                              fontFamily:'Montserrat',
                              fontWeight:FontWeight.bold,
                              color:Colors.grey,
                            ),
                            focusedBorder: UnderlineInputBorder(borderSide:BorderSide(color:Colors.deepPurple) ),
                            ),
                            
                            //onChanged: bloc.changeUserStore
                          );                       
}

Widget productsGrid(List<Product> data,aspectRadtio){
   return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio:aspectRadtio),
        itemBuilder: (BuildContext context,int index){
          return Padding(
              padding: EdgeInsets.all(5.0),
              child: GestureDetector(
                onTap: ()=>Navigator.of(context).pushNamed('/detail',arguments:data[index]),
                  //print("Product Click Data :-${product.title}");
                child: Container(
                    height: 350.0,
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 8.0
                          )
                        ]
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 170.0,
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    child: cacheImage(data[index].image),
                                  ),
                                ),
                                SizedBox(width:10.0,),
                                Container(
                                  child: data[index].fav ? Icon(Icons.favorite,size: 20.0,color: Colors.red,) : Icon(Icons.favorite_border,size: 20.0,),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text("${data[index].title}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0,color: Colors.deepPurple[900]),),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new StarRating(
                                  size: 15.0,
                                  rating: data[index].rating,
                                  color: Colors.orange,
                                  borderColor: Colors.grey,
                                  starCount: 5
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 10.0),
                                child: Text("\#${data[index].price.toString()}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepPurple[900]),),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                ),
              )
          );
        },
        itemCount: data.length,
      ),
    );
}

 Widget buildDot(int index,int num){
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
        height: 10.0,
        width: 10.0,
        decoration: BoxDecoration(

            color: (num == index ) ? Colors.black38 : Colors.grey[200],
            shape: BoxShape.circle
        ),
      ),
    );
  }


Widget generateCart(Product product){
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white12,
            border: Border(
                bottom: BorderSide(
                    color: Colors.grey[100],
                    width: 1.0
                ),
              top: BorderSide(
                  color: Colors.grey[100],
                  width: 1.0
              ),
            )
        ),
        height: 100.0,
        child: Row(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5.0
                  )
                ],
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0)
                ),
              ),
              child: cacheImage(product.image),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 10.0,left: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(product.title,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15.0,color: Colors.deepPurple[900]),),
                        ),
                        Container(
                            alignment: Alignment.bottomRight,
                            child: ScopedModelDescendant<CartViewModel>(
                            builder: (context,child,model){
                                return InkResponse(
                                    onTap: (){
                                      model.removeCart(product);
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 10.0),
                                      child: Icon(Icons.remove_circle,color: Colors.red,),
                                    )
                                );
                              },
                            )
                        )
                        ],
                    ),
                    SizedBox(height: 5.0,),
                    Text("Price #${product.price.toString()}",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15.0,color: Colors.deepPurple[900])),

                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }

Widget cartList(CartViewModel viewModel){
  return Container(
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
                    color: Colors.grey[300],
                    width: 1.0
                )
            )
        ),
        child: ListView(
              shrinkWrap: true,
              children: viewModel.cartListing.map((d)=>generateCart(d)).toList(),
            )
      );
}

Widget productDetailsBottomNavigation(Product item,CartViewModel viewModel,Function showCartSnak){
  return Container(
              margin: EdgeInsets.only(bottom: 18.0),
              height: 60.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      top: BorderSide(color: Colors.grey[300],width: 1.0)
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 60.0,
                          child: Text("Total Amount",style: TextStyle(fontSize: 12.0,color: Colors.grey),),
                        ),
                        Text("\#${item.price.toString()}",style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w600,color: Colors.deepPurple[900])),
                      ],
                    ),
                  ),
                  
                RaisedButton(
                        color: Colors.deepOrange,
                        onPressed: (){
                          viewModel.addCart(item);
                          Timer(Duration(milliseconds: 500), (){
                            showCartSnak(viewModel.cartMessage,viewModel.success);
                          });
                        },
                        child: Text("ADD TO CART",style: TextStyle(color: Colors.white),),
                      )
            
                  
                ],
              )
          );
}

Widget cacheImage(String url){
 return CachedNetworkImage(
        imageUrl: url,
        imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
        )
        ),
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
     );
}