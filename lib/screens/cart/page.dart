part of 'cart.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  ProgressDialog progressDialog;
  double total;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    progressDialog = new ProgressDialog(context, ProgressDialogType.Normal);
    progressDialog.setMessage('verifying coupon ...');
    return ScopedModelDescendant<CartViewModel>(
        builder: (context, child, model) {
      total = (locator<CartViewModel>().cart_cost + 500.00 + 10.00);
      return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: pageAppBar(context, Constant.cartItem),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                height: 150,
                child: Card(
                  elevation:12.0,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Sub total"),
                            Text(formatMoney(model.cart_cost)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Shipping cost"),
                            Text(
                              formatMoney(500),
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("VAT"),
                            Text(
                              formatMoney(10),
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Total",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(formatMoney(total)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                        width: 350,
                        height: 55.0,
                        child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Constant.getColor("1b4332"),
                            color: Constant.getColor("1b4332"),
                            elevation: 2.0,
                            child: RaisedButton(
                              color: model.cartListing.isEmpty
                                  ? Colors.green[800]
                                  : Constant.getColor("1b4332"),
                              onPressed: () => model.cartListing.isEmpty
                                  ? null
                                  : Navigator.of(context).pushNamed('/place_order'),
                              child: Text(
                                Constant.checkoutLabel,
                                style: TextStyle(
                                  //height:2.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                  fontSize: 15,
                                ),
                              ),
                            ))),
                    Container(
                    padding: const EdgeInsets.all(5.0),
                    width: 300,
                    height: 55.0,
                    child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Constant.getColor("1b4332"),
                        color: Constant.getColor("1b4332"),
                        elevation: 2.0,
                        child: RaisedButton(
                          color: model.cartListing.isEmpty
                              ? Colors.red[400]
                              : Colors.redAccent[400],
                          onPressed: () => model.cartListing.isEmpty
                              ? null
                              : model.clear_cart(),
                          child: Text(
                            Constant.clearCartLabel,
                            style: TextStyle(
                              //height:2.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                            ),
                          ),
                        ))),
                  ],
                ),
              ),
              Container(
                height:MediaQuery.of(context).size.height * 0.855,
                child: Card(
                    elevation:12,
                    child: ListView(
                    shrinkWrap: true,
                    // scrollDirection: Axis.vertical,
                    children: locator<CartViewModel>().cartListing.map((d) => generateCart(d)).toList(),
                  ),
                ),
              ),
              // ScopedModelDescendant<OrderViewModel>(
              //     builder: (context, child, model) {
              //   return Column(
              //     children: <Widget>[
              //       Align(
              //           alignment: Alignment.topLeft,
              //           child: Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: Row(
              //               children: <Widget>[
              //                 Text(
              //                   "Promotion Coupon",
              //                   style: TextStyle(
              //                       fontSize: 20, fontWeight: FontWeight.bold),
              //                 ),
              //                 SizedBox(
              //                   width: 5,
              //                 ),
              //                 Text(
              //                   "(if available)",
              //                   style: TextStyle(
              //                       fontSize: 13, fontWeight: FontWeight.w500),
              //                 ),
              //               ],
              //             ),
              //           )),
              //       CouponInput(
              //           length: 6,
              //           keyboardType: TextInputType.text,
              //           builder: CouponInputBuilders.darkCircle(),
              //           onFilled: (value) async {
              //             progressDialog.show();
              //             Future.delayed(const Duration(milliseconds: 1500),
              //                 () {
              //               progressDialog.hide();
              //               setState(() {
              //                 total = ((locator<CartViewModel>().cart_cost +
              //                         1000.00 +
              //                         10.00) -
              //                     500);
              //                 locator<CartViewModel>().update_total_base_on_coupon(500);
              //                 print("total is === $total");
              //               });
              //             });
                          // model.verifyCoupon(value,user.token).then((result) {
                          //   if (result['status']) {
                          //
                          //   locator<CartViewModel>().update_total_base_on_coupon(500);
                          //     progressDialog.hide();
                          //   } else {
                          //     progressDialog.hide();
                          //     ToastOn(result['message'], Colors.redAccent,
                          //         Colors.white, 20.0);
                          //   }
                          // }
                          // );
              //           })
              //     ],
              //   );
              // }),
            ],
          ),
        ),
      );
    });
  }
}
