import 'package:easy_order/models/Models.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

Widget generateOrderList(UserOrder order, context) {
  IconData icon;
  Color iconbgColor;
  if (order.order_status == 1) {
    icon = Feather.getIconData("clock");
    iconbgColor = Colors.amberAccent[700];
  } else if (order.order_status == 2) {
    icon = Feather.getIconData("activity");
    iconbgColor = Colors.purple[800];
  } else if (order.order_status == 3) {
    icon = Feather.getIconData("check-circle");
    iconbgColor = Colors.greenAccent[400];
  }
  return OrderItem(
    icon,
    iconbgColor,
    order.order_type,
    order.delivery_address,
    order,
    order.created_at,
  );
}

Widget emptyContentList(String title) {
  return Container(
    alignment: Alignment.center,
    child: Text(
      title,
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
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
      child: GestureDetector(
          onTap: () {
            // print("post ==> ${widget.item.toMap()}");
            Navigator.of(context)
                .pushNamed('/order/detail', arguments: widget.item);
          },
          child: Container(
            child: FittedBox(
              child: Material(
                color: Colors.white,
                elevation: 14,
                borderRadius: BorderRadius.circular(24.0),
                shadowColor: Constant.getColor("2196f3"),
                child: Row(
                  // mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _orderStatus(),
                    _details(),
                    Container(
                      width: 250,
                      height: 250,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24.0),
                        child: widget.item.order_status == 1 ||
                                widget.item.order_status == 2
                            ? Image.asset(
                                "assets/images/order.gif",
                                fit: BoxFit.cover,
                                width: 250,
                                height: 230,
                                alignment: Alignment.topRight,
                              )
                            : Image.asset(
                                "assets/images/present.gif",
                                fit: BoxFit.cover,
                                width: 250,
                                height: 230,
                                alignment: Alignment.topRight,
                              ),
                      ),
                      // ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }

  _details() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.order_type,
            style: TextStyle(
                fontSize: 45,
                fontFamily: "FontAwesome5Solid",
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                color: Colors.black),
          ),
          SizedBox(
            height: 5,
          ),
          _orderLocation(),
          _orderDate(),
        ],
      ),
    );
  }

  _orderDate() {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Row(
        children: <Widget>[
          Icon(
            Feather.getIconData("calendar"),
            size: 35,
            color: Constant.getColor("1b4332"),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            Constant.dateToString(widget.created_at),
            style: TextStyle(
                fontSize: 35,
                fontFamily: "FontAwesome5",
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
                color: Colors.grey),
          )
        ],
      ),
    );
  }
  _orderLocation() {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.location_on,
            size: 35,
            color: Constant.getColor("1b4332"),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            widget.delivery_address,
            style: TextStyle(
                fontSize: 35,
                fontFamily: "FontAwesome5",
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
                color: Colors.grey),
          )
        ],
      ),
    );
  }
  _orderStatus() {
    return Container(
      padding: EdgeInsets.all(10.0),
      width:150,
      child: Icon(
        widget.icon,
        color: widget.iconBgColor,
        size:70,
      ),
    );
  }
}
