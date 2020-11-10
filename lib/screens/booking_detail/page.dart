part of 'booking_info.dart';

class BookingDetailsPage extends StatefulWidget {
  Booking detail;

  BookingDetailsPage({@required this.detail});

  @override
  State<StatefulWidget> createState() => BookingDetailsPageState();
}

class BookingDetailsPageState extends State<BookingDetailsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  PageController _controller;
  int active = 0;
  dynamic post_detail;
  String createdAt;

  @override
  void initState() {
    super.initState();
    post_detail = widget.detail.toMap();
  }

  @override
  Widget build(BuildContext context) {

    createdAt = Constant.dateToString(post_detail['created_at']);
    

    return ScopedModelDescendant<ChefViewModel>(
        builder: (context, child, model) {
      return SafeArea(
        bottom: false,
        top: false,
        child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.white,
          appBar: pageAppBar(context, Constant.postDetail),
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
                  
                  ],
                )),
          ),
        ),
      );
    });
  }
}


