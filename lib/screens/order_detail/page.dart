part of 'detail.dart';

class OrderDetailsPage extends StatefulWidget {
  UserOrder detail;

  OrderDetailsPage({@required this.detail});

  @override
  State<StatefulWidget> createState() => OrderDetailsPageState();
}

class OrderDetailsPageState extends State<OrderDetailsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  PageController _controller;
  int active = 0;
  dynamic order_detail;
  List<dynamic> orders;
  String status;
  Color iconbgColor;
  String deliverAt;

  @override
  void initState() {
    super.initState();
    order_detail = widget.detail.toMap();
  }

  @override
  Widget build(BuildContext context) {
    orders = order_detail['order'];
    // print("order list ====> $orders");
    if (order_detail['order_status'] == 1) {
      status = 'Processing';
      iconbgColor = Colors.amberAccent[700];
    } else if (order_detail['order_status'] == 2) {
      status = "Pending";
      iconbgColor = Colors.purple[800];
    } else if (order_detail['order_status'] == 3) {
      status = "Delivered";
      iconbgColor = Colors.greenAccent[400];
    }

    if (order_detail['order_type'] == 2) {
      deliverAt = Constant.dateToString(order_detail['delivery_at']);
    } else {
      deliverAt = order_detail['delivery_at'];
    }

    return ScopedModelDescendant<OrderViewModel>(
        builder: (context, child, model) {
      return SafeArea(
        bottom: false,
        top: false,
        child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.white,
          appBar: pageAppBar(context, "Order Detail"),
          body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(color: Colors.grey[300], width: 1.0))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                       crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topLeft,
                                                          child: Text(
                                "Order Status",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "FontAwesome5Brands",
                                    color: Colors.black87),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              status,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  fontFamily: "FontAwesome5Brands",
                                  color: iconbgColor,
                                  ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Order Type",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "FontAwesome5Brands",
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              order_detail['order_type'],
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "FontAwesome5Brands",
                                  color: Colors.black38),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    LocationItem(
                        title: "Delivery Address",
                        content: order_detail['delivery_address']),
                    SizedBox(
                      height: 15,
                    ),
                    LocationItem(
                        title: "Delivery L.G.A",
                        content: order_detail['delivery_lga']),
                    SizedBox(
                      height: 15,
                    ),
                    LocationItem(
                        title: "Delivery State",
                        content: order_detail['delivery_state']),
                    SizedBox(
                      height: 15,
                    ),
                    InfoItem(title: "Date to be deliver", content: deliverAt),
                    SizedBox(
                      height: 22,
                    ),
                    InfoItem(
                        title: "Total cost",
                        content: formatMoney(double.parse(order_detail['total_cost']))),
                    SizedBox(
                      height: 22,
                    ),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Product Name',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "FontAwesome5Brands",
                                    color: Colors.black),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Product Quantity',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "FontAwesome5Brands",
                                    color: Colors.black),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Product Price',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "FontAwesome5Brands",
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ListView(
                              shrinkWrap: true,
                              // scrollDirection: Axis.vertical,
                              children: orders
                                  .map((item) => orderedItem(item))
                                  .toList()),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    InfoItem(
                        title: "Date of order",
                        content:
                            Constant.dateToString(order_detail['created_at'])),
                  ],
                )),
          ),
        ),
      );
    });
  }
}

class InfoItem extends StatelessWidget {
  const InfoItem({Key key, this.title, this.content}) : super(key: key);

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "FontAwesome5Brands",
                  color: Colors.black87),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              content,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  fontFamily: "FontAwesome5Brands",
                  color: Colors.black38),
            ),
          ),
        ],
      ),
    );
  }
}

class LocationItem extends StatelessWidget {
  const LocationItem({Key key, this.title, this.content}) : super(key: key);

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: "FontAwesome5Brands",
                  color: Colors.black87),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.location_on,
                  color: Colors.black38,
                  size: 17,
                ),
                SizedBox(
                  width: 2,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(
                    content,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      fontFamily: "FontAwesome5",
                      color: Colors.black38,
                    ),
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget orderedItem(dynamic item) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          item['title'],
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: "FontAwesome5Brands",
              color: Colors.black38),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          item['quantity'],
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              fontFamily: "FontAwesome5Brands",
              color: Colors.black38),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          formatMoney(item['price'] * int.parse(item['quantity'])),
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              fontFamily: "FontAwesome5Brands",
              color: Colors.black38),
        ),
      ],
    )),
  );
}
