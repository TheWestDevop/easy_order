
import 'dart:async';

import 'package:easy_order/models/models.dart';
import 'package:easy_order/services/services.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:easy_order/viewModel/viewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:provider/provider.dart';
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
                            prefixIcon: Icon(Icons.search,color:Colors.deepPurple),
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
                                    child: Image.network(data[index].image,fit: BoxFit.contain,),
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
                          child: Text("${data[index].title}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0),),
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
                                child: Text("\#${data[index].price.toString()}",style: TextStyle(fontWeight: FontWeight.bold),),
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


Widget productDetails(Product item,PageController _controller,CartViewModel viewModel,int active, Function showSnak,Function setState){
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
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: 280.0,
                      padding: EdgeInsets.only(top: 10.0),
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 200.0,
                            child: PageView(
                              controller: _controller,
                              onPageChanged: (index){
                                print(index);
                                setState(() {
                                                                  active = index;
                                                                });
                                                              },
                                                              children: <Widget>[
                                                                Image.network(item.image,height: 150.0,),
                                                                Image.network(item.image,height: 150.0,),
                                                                Image.network(item.image,height: 150.0,),
                                                                Image.network(item.image,height: 150.0,)
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(height: 10.0,),
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: <Widget>[
                                                              buildDot(active,0),
                                                              buildDot(active,1),
                                                              buildDot(active,2),
                                                              buildDot(active,3)
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                        height: 270.0,
                                                        alignment: Alignment(1.0, 1.0),
                                                        child: Padding(
                                                          padding: EdgeInsets.only(right: 15.0),
                                                          child: Column(
                                                            verticalDirection: VerticalDirection.down,
                                                            crossAxisAlignment: CrossAxisAlignment.end,
                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                            children: <Widget>[
                                                              
                                                                GestureDetector(
                                                                    onTap: (){
                                                                      print(item);
                                                                      viewModel.addToFav(item);
                                                                      showSnak(item.fav,item.title);
                                                                    },
                                                                    child: item.fav ? Icon(Icons.favorite,size: 20.0,color: Colors.red,) : Icon(Icons.favorite_border,size: 20.0,),
                                                                  )
                                                
                                                            ],
                                                          ),
                                                        )
                                                    )
                                                  ],
                                                ),
                                                Divider(color: Colors.grey[300],height: 1.0,),
                                                Container(
                                                  padding: EdgeInsets.symmetric(horizontal: 50.0,vertical: 20.0),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      Text(item.title,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 19.0),),
                                                      Padding(
                                                        padding: EdgeInsets.only(top: 10.0),
                                                        child: Text(item.description),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
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
                image: DecorationImage(image: NetworkImage(product.image),fit: BoxFit.fill)
              ),
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
                          child: Text(product.title,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15.0),),
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
                    Text("Price ${product.price.toString()}"),

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
                        Text("\#${item.price.toString()}",style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w600)),
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