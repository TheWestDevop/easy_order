import 'package:easy_order/models/models.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:easy_order/viewModel/viewModel.dart';
import 'package:easy_order/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

Widget chefTable(context,List<Chef> chef,Function chefSearch){
   var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 3;
    final double itemWidth = size.width / 2;
  return new Column(
        children: <Widget>[
          searchKitchenField(chefSearch),
          new Expanded(
            child: chefsGrid(chef,(itemWidth / itemHeight))
        )
        ],
      );
}

Widget searchChefField(Function chefSearch){
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: TextFormField(
                              decoration:InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25.0)),borderSide:BorderSide(color:Colors.deepPurple) ),
                              prefixIcon: Icon(Icons.search,color:Colors.deepPurple[900]),
                              labelText: Constant.searchChefPlaceholder,
                              labelStyle: TextStyle(
                                fontFamily:'Montserrat',
                                fontWeight:FontWeight.bold,
                                color:Colors.grey,
                              ),
                              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25.0)),borderSide:BorderSide(color:Colors.deepPurple) )
                              ),
                              onChanged:(val)=>chefSearch(val)
                            ),
  );                       
}

Widget chefsGrid(List<Chef> data,aspectRadtio){
   return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio:aspectRadtio),
        itemBuilder: (BuildContext context,int index){
          return Padding(
              padding: EdgeInsets.all(5.0),
              child: GestureDetector(
                onTap: ()=>Navigator.of(context).pushNamed('/kitchen/detail',arguments:data[index]),
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
                          height: 130.0,
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    height:100.0,
                                    child: CircleAvatar(
                                      //child:,
                                      backgroundImage: NetworkImage(data[index].image),
                                      radius:200/4,),
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
                          padding: EdgeInsets.only(left: 15.0),
                          child: Text("${data[index].name}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0,color: Colors.deepPurple[900]),),
                        ),
                        SizedBox(height: 10.0,),
                        Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Text("${data[index].experience}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10.0,color: Colors.deepPurple[900]),),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15.0),
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
                                child: Text("${data[index].experience_years} year exp",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10.0,color: Colors.deepPurple[900],),)
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

Widget chefDetailsBottomNavigation(ChefViewModel viewModel,Function showCartSnak){
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
                          child: Text("Amount",style: TextStyle(fontSize: 12.0,color: Colors.grey),),
                        ),
                        Text("\#500",style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w600,color: Colors.deepPurple[900])),
                      ],
                    ),
                  ),
                  
                RaisedButton(
                        color: Colors.deepOrange,
                        onPressed: (){
                          // viewModel.addCart(item);
                          // Timer(Duration(milliseconds: 500), (){
                          //   showCartSnak(viewModel.cartMessage,viewModel.success);
                          // });
                        },
                        child: Text("Book",style: TextStyle(color: Colors.white),),
                      )
            
                  
                ],
              )
          );
}
