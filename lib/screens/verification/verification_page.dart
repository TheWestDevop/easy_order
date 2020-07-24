part of 'verification.dart';

class VerificationForm extends StatefulWidget {
  @override
  _VerificationFormState createState() => _VerificationFormState();
}

class _VerificationFormState extends State<VerificationForm> {
  ProgressDialog progressDialog;
  String _state;
  String _lga;
  String _orderType;
  String _address;
  DateTime preOrderDeliveryDate;
  String publicKey = 'pk_live_4563d500bb579bb7d2446ea3fb1407f990a2e00d';
  CheckoutMethod _method = CheckoutMethod.card;
  bool _inProgress = true;
  String _cardNumber;
  String _cvv;
  int _expiryMonth = 0;
  int _expiryYear = 0;
  Profile user;
  double order_cost;

  final GlobalKey<FormState> _globalKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    PaystackPlugin.initialize(publicKey: publicKey);
    user = locator<AccountViewModel>().profile;
    order_cost = (locator<CartViewModel>().cart_cost + 1000.00 + 10.00);
  }

  @override
  Widget build(BuildContext context) {
    progressDialog = new ProgressDialog(context, ProgressDialogType.Normal);
    progressDialog.setMessage('processing payment ...');
    print("address 1 ==> $_address");
    // print("address  2 ==> ${controller.text}");
    final format = DateFormat("EEEE, d MMMM yyyy h:mm a");
    var _currentPreOrderDate = DateTime.now().add(Duration(days: 2));

    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: pageAppBar(context, Constant.deliveryLabel),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  // height: MediaQuery.of(context).size.height / 2,
                  padding: EdgeInsets.only(top: 20, left: 20.0, right: 20.0),
                  child: Form(
                      key: _globalKey,
                      child: Column(
                        children: <Widget>[
                          orderTypeDropdown(),
                          SizedBox(
                            height: 25.0,
                          ),
                          if (_orderType == 'Pre Order') ...[
                            DateTimeField(
                              autovalidate: true,
                              validator: (date) => date == null
                                  ? 'Pre order delivery date and time is required'
                                  : null,
                              initialValue: _currentPreOrderDate,
                              format: format,
                              onShowPicker:
                                  (context, _currentPreOrderDate) async {
                                final date = await showDatePicker(
                                    context: context,
                                    firstDate: DateTime(1900),
                                    initialDate: _currentPreOrderDate ??
                                        DateTime.now().add(Duration(days: 2)),
                                    lastDate: DateTime(2100));
                                if (date != null) {
                                  final time = await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.fromDateTime(
                                          _currentPreOrderDate ??
                                              DateTime.now()
                                                  .add(Duration(days: 2))));
                                  var now =
                                      DateTime.now().add(Duration(days: 1));
                                  var datePicked =
                                      DateTimeField.combine(date, time);
                                  // print("pre order date selected ---> ${date_picked.toString()}");
                                  if (now.isBefore(datePicked)) {
                                    preOrderDeliveryDate = datePicked;
                                    print(
                                        "pre order date selected ---> ${preOrderDeliveryDate.toString()}");
                                    return DateTimeField.combine(date, time);
                                  } else {
                                    ToastOn(
                                        "2 days Interval is required for all Pre Order Goods",
                                        Colors.redAccent[400],
                                        Colors.white,
                                        15.0);
                                    return _currentPreOrderDate;
                                  }
                                } else {
                                  return _currentPreOrderDate;
                                }
                              },
                            ),
                            SizedBox(
                              height: 25.0,
                            )
                          ],
                          addressField(),
                          SizedBox(
                            height: 25.0,
                          ),
                          stateDropdown(),
                          SizedBox(
                            height: 25.0,
                          ),
                          lgaDropdown(),
                          SizedBox(
                            height: 20.0,
                          ),
                          placeOrderBtn(),
                        ],
                      )),
                ),
              ])
        ],
      ),
    );
  }

  String _getReference() {
    String platform;
    if (Platform.isIOS) {
      platform = 'iOS';
    } else {
      platform = 'Android';
    }

    return 'PaymentFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
  }

  PaymentCard _getCardFromUI() {
    // Using just the must-required parameters.
    return PaymentCard(
      number: _cardNumber,
      cvc: _cvv,
      expiryMonth: _expiryMonth,
      expiryYear: _expiryYear,
    );
  }

  _handleCheckout(double _amount) async {
    Charge charge = Charge()
      ..amount = (_amount * 100).round()
      ..email = user.email
      ..card = _getCardFromUI();

    charge.reference = _getReference();
    CheckoutResponse response = await PaystackPlugin.checkout(context,
        method: _method, charge: charge, fullscreen: false);
    print("payment response body ----> $response");
    if (response.status) {
      progressDialog.show();
      var _order = Order(
        user_id: user.id,
        delivery_state: _state,
        delivery_address: _address,
        delivery_lga: _lga,
        delivery_at: _orderType == 'Fast Order'
            ? 'WithIn 24Hours'
            : preOrderDeliveryDate.toString(),
        total_cost: _amount.toString(),
        coupon: 'None',
        order: locator<CartViewModel>().cartListing,
        order_type: _orderType == 'Fast Order' ? 1 : 2,
      );
      locator<OrderViewModel>().placeOrder(_order).then((result) {
        if (result['status']) {
          progressDialog.hide();
          Navigator.of(context).pushNamed('/home', arguments: user);
        } else {
          progressDialog.hide();
          ToastOn(result['message'], Colors.redAccent, Colors.white, 15.0);
        }
      });
    } else {
      ToastOn(response.message, Colors.orange[700], Colors.white, 15.0);
    }
  }

  addressField() {
    return Container(
      child: TextFormField(
        validator: (val) => validateStringField(val),
        onChanged: (val) => setState(() => _address = val),
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.location_city, color: Colors.green[900]),
          labelText: Constant.addressPlaceholder,
          labelStyle: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green[700])),
          //errorText: snapshot.error,
        ),
        //onChanged: bloc.changeUserEmail,
      ),
    );
  }

  stateDropdown() {
    //print("money format :- ${formatMoney(500)}");
    List<String> _states = ['Lagos', 'Abuja']; // Option 2
    return Container(
      child: DropdownButton(
        isExpanded: true,
        icon: Icon(
          Icons.location_on,
          color: Colors.green[900],
        ),
        hint:
            Text('Please choose delivery state'), // Not necessary for Option 1
        value: _state,
        onChanged: (newValue) {
          setState(() {
            _state = newValue;
            if (_state == 'Lagos') {
              _lga = 'Ikeja';
            } else {
              _lga = 'Wuse';
            }
          });
        },
        items: _states.map((state) {
          return DropdownMenuItem(
            child: new Text(state,
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.green[900])),
            value: state,
          );
        }).toList(),
      ),
    );
  }

  orderTypeDropdown() {
    //print("money format :- ${formatMoney(500)}");
    List<String> _orders = ['Fast Order', 'Pre Order']; // Option 2
    return Container(
      child: DropdownButton(
        isExpanded: true,
        icon: Icon(
          Icons.fastfood,
          color: Colors.green[900],
        ),
        hint: Text('Please choose order type'), // Not necessary for Option 1
        value: _orderType,
        onChanged: (newValue) {
          setState(() {
            _orderType = newValue;
          });
        },
        items: _orders.map((order) {
          return DropdownMenuItem(
            child: new Text(order,
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.green[900])),
            value: order,
          );
        }).toList(),
      ),
    );
  }

  lgaDropdown() {
    //print("money format :- ${formatMoney(500)}");
    // Option 2
    // Option 2
    return Container(
      child: DropdownButton(
        isExpanded: true,
        icon: Icon(
          Icons.location_on,
          color: Colors.green[900],
        ),
        hint: Text('Please choose delivery L.G.A'),
        // Not necessary for Option 1
        value: _lga,
        onChanged: (newValue) {
          setState(() {
            _lga = newValue;
          });
        },
        items: lgaSwitching(_state),
      ),
    );
  }

  List<DropdownMenuItem<String>> lgaSwitching(String state) {
    print("state ==> $state");
    List<String> _lagosLga = ['Ikeja', 'Surulere'];
    List<String> _abujaLga = ['Wuse', 'Gwagwalada'];

    if (_state == 'Lagos') {
      return _lagosLga.map((lga) {
        // setState(() {
        //   _lga = 'Ikeja';
        // });
        return DropdownMenuItem(
          child: new Text(lga,
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.green[900])),
          value: lga,
        );
      }).toList();
    } else if (_state == 'Abuja') {
      return _abujaLga.map((lga) {
        return DropdownMenuItem(
          child: new Text(lga,
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.green[900])),
          value: lga,
        );
      }).toList();
    }
  }

  placeOrderBtn() {
    return Container(
        height: 55.0,
        child: Material(
            borderRadius: BorderRadius.circular(20.0),
            shadowColor: Colors.green[900],
            color: _state == null ||
                    _lga == null ||
                    _orderType == null ||
                    _address == null ||
                    _address.isEmpty
                ? Colors.green[200]
                : Colors.green[900],
            elevation: 7.0,
            child: GestureDetector(
              onTap: () => _state == null ||
                      _lga == null ||
                      _address == null ||
                      _address.isEmpty && _address.length < 10
                  ? null
                  : _handleCheckout(order_cost), //:  null,
              child: Center(
                  child: Text(
                Constant.placeOrderBtn,
                style: TextStyle(
                  //height:2.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                  fontSize: 25,
                ),
              )),
            )));
  }
}
