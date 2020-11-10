part of 'how_to.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
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
    progressDialog.setMessage('Loading Recipes...');
    if (status) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => fetchPosts(),
      );
    }
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: specialPageAppBar(context, Constant.howToCooking,"/search/posts"),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
             crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.855,
                  child: RefreshIndicator(
                    onRefresh: () => fetchPosts(),
                    child: status
                        ? Text("")
                        : (locator<RecipeViewModel>().posts.isEmpty
                            ? emptyContentList("No Recipe Available")
                            : 
                                Container(
                                    color: Colors.white38,
                                    // height:MediaQuery.of(context).size.height,
                                    child: ListView(
                                        shrinkWrap: true,
                                        // scrollDirection: Axis.vertical,
                                        children: locator<RecipeViewModel>().posts
                                            .map((post) =>
                                                generatePostList(post))
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

  fetchPosts() async {
    progressDialog.show();
    var response = await locator<RecipeViewModel>().getPosts(user.token);
    if (response['status']) {
      setState(() {
        status = false;
      });
      // print(locator<PostViewModel>().posts);
      // items = locator<PostViewModel>().posts;
      progressDialog.hide();
    } else {
      print(response);
      progressDialog.hide();
      ToastOn(response['message'], Colors.red[900], Colors.white, 18.0);
    }
  }

}
