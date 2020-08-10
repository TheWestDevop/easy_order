import 'package:easy_order/models/models.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:easy_order/viewModel/viewModel.dart';
import 'package:easy_order/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_rating/flutter_rating.dart';

Widget chefTable(context,List<Chef> chef,Function chefSearch){
   var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 3;
    final double itemWidth = size.width / 2;
  return Column(
        children: <Widget>[
          Card(
            child: Column(
              children: <Widget>[],
            ),
          ),
          new Expanded(
            child: chefsGrid(chef,(itemWidth / itemHeight))
        )
        ],
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
                onTap: null,//()=>Navigator.of(context).pushNamed('/kitchen/detail',arguments:data[index]),
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
                                      backgroundImage: AssetImage("assets/images/chef.gif"),
                                      radius:100/6,),
                                  ),
                                ),
                                // SizedBox(width:10.0,),
                                // Container(
                                //   child: data[index].fav ? Icon(Icons.favorite,size: 20.0,color: Colors.red,) : Icon(Icons.favorite_border,size: 20.0,),
                                // )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Text("${data[index].dish}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0,color: Colors.deepPurple[900]),),
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
                                child: Text(data[index].experience,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10.0,color: Colors.deepPurple[900],),)
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


Widget generateBookingList(Bookings bookings, context) {
  var item = bookings.toMap();
  IconData icon;
  Color iconbgColor;
  if (item['booking_status'] == 1) {
    icon = Feather.getIconData("clock");
    iconbgColor = Colors.amberAccent[700];
  } else if (item['booking_status'] == 2) {
    icon = Feather.getIconData("activity");
    iconbgColor = Colors.purple[800];
  } else if (item['booking_status'] == 3) {
    icon = Feather.getIconData("check-circle");
    iconbgColor = Colors.greenAccent[400];
  }
  return BookingItem(
    icon,
    iconbgColor,
    item['dish'],
    formatMoney(item['dish_cost']),
    bookings,
    item['created_at'],
  );
}

Widget emptyBookingList() {
  return Container(
    alignment: Alignment.center,
    child: Text(
      "No Booking Available",
      style: TextStyle(
        color: Colors.black87,
        fontStyle: FontStyle.italic,
        fontSize: 20,
        fontFamily: "LineAwesome",
      ),
    ),
  );
}

class BookingItem extends StatefulWidget {
  final IconData icon;
  final Color iconBgColor;
  final String created_at;
  final String dish;
  final String dish_cost;
  final Bookings item;

  BookingItem(this.icon, this.iconBgColor, this.dish, this.dish_cost,
      this.item, this.created_at);

  @override
  _BookingItemState createState() => _BookingItemState();
}

class _BookingItemState extends State<BookingItem> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10,10),
      child: Container(
        // color: Colors.white54,
        decoration:BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
        child: ListTile(
          onTap: () => {
            //print(widget.item.toMap()),
            Navigator.of(context).pushNamed('/order/detail', arguments: widget.item)
          },
          trailing: Icon(
            Icons.chevron_right,
            size: 20,
          ),
          subtitle:Column(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                      
                          width:MediaQuery.of(context).size.width/2,
                          child: Text(
                           widget.dish_cost,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                fontFamily: "FontAwesome5",
                                color: Colors.black38,
                              
                                ),
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                  height: 10,
                ),
                    Align(
                   alignment:Alignment.topLeft,
                   child: Text(
                    Constant.dateToString(widget.created_at),
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        fontFamily: "LineAwesome",
                        fontStyle: FontStyle.italic,
                        color: Colors.black38
                        ),
                  ),
                ),
              ],
          ),
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.dish,
              style: TextStyle(
                  fontSize: 20, 
                  fontWeight: FontWeight.w700,
                  fontFamily: "FontAwesome5Brands", 
                  color: Colors.black87),
            ),
          ),
          leading: Icon(
            widget.icon,
            color: widget.iconBgColor,
            size: 28,
          ),
        ),
      ),
    );
  }

}
