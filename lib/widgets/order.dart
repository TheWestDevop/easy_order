import 'dart:math' as math;
import 'package:intl/intl.dart';

import 'package:division/division.dart';
import 'package:easy_order/models/models.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

Widget generateOrderList(UserOrder order, context) {
  var item = order.toMap();
  IconData icon;
  Color iconbgColor;
  if (item['order_status'] == 1) {
    icon = Feather.getIconData("clock");
    iconbgColor = Colors.amberAccent[700];
  } else if (item['order_status'] == 2) {
    icon = Feather.getIconData("activity");
    iconbgColor = Colors.purple[800];
  } else if (item['order_status'] == 3) {
    icon = Feather.getIconData("check-circle");
    iconbgColor = Colors.greenAccent[400];
  }
  return OrderItem(
    icon,
    iconbgColor,
    item['order_type'],
    item['delivery_address'],
    order,
    item['created_at'],
  );
}

Widget emptyOrderList() {
  return Container(
    alignment: Alignment.center,
    child: Text(
      "No Order Available",
      style: TextStyle(
        color: Colors.black87,
        fontStyle: FontStyle.italic,
        fontSize: 20,
        fontFamily: "LineAwesome",
      ),
    ),
  );
}

class OrderItem extends StatefulWidget {
  final IconData icon;
  final Color iconBgColor;
  final String created_at;
  final String order_type;
  final String delivery_address;
  final UserOrder item;

  OrderItem(this.icon, this.iconBgColor, this.order_type, this.delivery_address,
      this.item, this.created_at);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
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
                SizedBox(
                  height: 10,
                ),
                    Row(
                      mainAxisAlignment:MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                         Icon(
                          Icons.location_on,
                          color:Colors.black38,
                          size: 15,
                        ),
                        SizedBox(
                  width:2,
                ),
                        Container(
                          width:MediaQuery.of(context).size.width/2,
                          child: Text(
                           widget.delivery_address,
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
                      ],
                    ),
                    SizedBox(
                  height:5,
                ),
              ],
          ),
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.order_type,
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
