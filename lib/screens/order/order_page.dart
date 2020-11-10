part of 'order.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  Profile user;
  ProgressDialog progressDialog;
  bool status = true;

  @override
  void initState() {
    super.initState();
    user = locator<AccountViewModel>().profile;
  }

  @override
  Widget build(BuildContext context) {
    progressDialog = new ProgressDialog(context, ProgressDialogType.Normal);
    progressDialog.setMessage('Loading Orders...');
    if (status) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => fetchOrders(),
      );
    }
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: pageAppBar(context, Constant.orderListPlaceholder),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  child: RefreshIndicator(
                    onRefresh: () => locator<OrderViewModel>()
                        .getUserOrders(user.id, user.token),
                    child: status
                        ? Text("")
                        : (locator<OrderViewModel>().orders.isEmpty
                            ? emptyContentList("No Order Available")
                            : Container(
                              color:Colors.white38,
                              child: ListView(
                                  shrinkWrap: true,
                                  
                                  // scrollDirection: Axis.vertical,
                                  children: locator<OrderViewModel>()
                                      .orders
                                      .map((order) =>
                                          generateOrderList(order, context))
                                      .toList()
                                  ),
                            )
                                    ),
                  ),
                ),
              ])
        ],
      ),
      //bottomNavigationBar: bottomNavBar(context,1),
    );
  }

  fetchOrders() async {
    progressDialog.show();
    var response =
        await locator<OrderViewModel>().getUserOrders(user.id, user.token);
    if (response['status']) {
      setState(() {
        status = false;
      });
      progressDialog.hide();
    } else {
      print(response);
      progressDialog.hide();
      ToastOn(response['message'], Colors.red[900], Colors.white, 18.0);
    }
  }
}
