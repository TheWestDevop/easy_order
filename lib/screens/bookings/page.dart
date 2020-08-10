part of 'booking.dart';

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
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
    progressDialog.setMessage('Loading Bookings...');
    if (status) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => fetchBookings(),
      );
    }
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: pageAppBar(context, Constant.bookingListPlaceholder),
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
                    onRefresh: () => locator<ChefViewModel>()
                        .getUserBookings(user.id, user.token),
                    child: status
                        ? Text("")
                        : (locator<ChefViewModel>().bookings.isEmpty
                            ? emptyBookingList()
                            : Container(
                              color:Colors.white38,
                              child: ListView(
                                  shrinkWrap: true,
                                  
                                  // scrollDirection: Axis.vertical,
                                  children: locator<ChefViewModel>()
                                      .bookings
                                      .map((booking) =>
                                          generateBookingList(booking, context))
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

  fetchBookings() async {
    progressDialog.show();
    var response = await locator<ChefViewModel>().getUserBookings(user.id, user.token);
    // print("user bookings response ==> $response");

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
