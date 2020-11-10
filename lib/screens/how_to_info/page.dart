part of 'info.dart';

class RecipeDetailsPage extends StatefulWidget {
  Recipe detail;

  RecipeDetailsPage({@required this.detail});

  @override
  State<StatefulWidget> createState() => RecipeDetailsPageState();
}

class RecipeDetailsPageState extends State<RecipeDetailsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  PageController _controller;
  int active = 0;
  String createdAt;
  bool liked = false;
  int view_count;
  @override
  void initState() {
    // print("user token ==> ${locator<AccountViewModel>().profile.token}");
    view_count = widget.detail.views + 1;
    locator<RecipeViewModel>().postViewed(
        widget.detail.post_id, locator<AccountViewModel>().profile.token);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<RecipeViewModel>(
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
                  // padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  // decoration: BoxDecoration(
                  //     border: Border(
                  //         top: BorderSide(color: Colors.grey[300], width: 1.0))),
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    // child: FittedBox(
                      child: ClipRRect(
                        // borderRadius: BorderRadius.circular(24.0),
                        child: Image(
                          image: CachedNetworkImageProvider(
                              widget.detail.featured_image),
                          fit: BoxFit.contain,
                          alignment: Alignment.center,
                        ),
                      // ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          widget.detail.title_header,
                          style: TextStyle(
                              fontSize: 28,
                              fontFamily: "FontAwesome5Solid",
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 3.0,
                        ),
                        postObj("author ", widget.detail.author),
                        SizedBox(
                          height: 3.0,
                        ),
                        postObj("created on",
                            Constant.dateToString(widget.detail.created_at)),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey[300],
                    height: 1.0,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        widget.detail.body,
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Wavehaus",
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            color: Colors.black),
                      )),
                ],
              )),
            ),
            bottomNavigationBar: bottomBar()),
      );
    });
  }

  postObj(String text, String val) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Row(
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
                fontSize: 15,
                fontFamily: "FontAwesome5",
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
                color: Colors.grey),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            val,
            style: TextStyle(
                fontSize: 15,
                fontFamily: "FontAwesome5",
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
                color: Colors.grey),
          )
        ],
      ),
    );
  }

  bottomBar() {
    return Container(
        margin: EdgeInsets.only(bottom: 18.0),
        height: 60.0,
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(top: BorderSide(color: Colors.grey[300], width: 1.0))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  Feather.getIconData("eye"),
                  size: 20,
                  color: Constant.getColor("1b4332"),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "$view_count",
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: "FontAwesome5",
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      color: Colors.grey),
                )
              ],
            ),
            // GestureDetector(
            //   child: Icon(
            //     Feather.getIconData("thumbs-up"),
            //     size: 20,
            //     color: liked ? Constant.getColor("1b4332") : Colors.black54,
            //   ),
            //   onTap: () {
            //     setState(() {
            //       liked = !liked;
            //     });
            //     locator<PostViewModel>().likePost(widget.detail.post_id,
            //         locator<AccountViewModel>().profile.token);
            //   },
            // ),
            SizedBox(
              width: 10,
            ),
            RaisedButton(
              color: Constant.getColor("1b4332"),
              onPressed: () {
                // viewModel.addCart(item);
                // Timer(Duration(milliseconds: 500), () {
                //   showCartSnak(viewModel.cartMessage, viewModel.success);
                // });
                print("chef id ==> ${widget.detail.user_id}");
              },
              child: Row(children: <Widget>[
                Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Book Chef",
                  style: TextStyle(
                      fontWeight: FontWeight.w700, color: Colors.white),
                ),
              ]),
            ),
          ],
        ));
  }
}
