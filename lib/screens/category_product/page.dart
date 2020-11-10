part of 'category_product.dart';

class ProductCategoryPage extends StatefulWidget {
  final int category;
  final String category_title;


  const ProductCategoryPage({Key key, @required this.category, @required this.category_title}) : super(key: key);
  @override
  _ProductCategoryPageState createState() => _ProductCategoryPageState();
}

class _ProductCategoryPageState extends State<ProductCategoryPage> {
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
    progressDialog.setMessage('Loading ${widget.category_title}...');
    if (status) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => fetchCategory(),
      );
    }
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: specialPageAppBar(context, "${widget.category_title} Products","/search/product"),
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
                    onRefresh: () => locator<ProductViewModel>()
                        .getProductsCategory(user.id, user.token),
                    child: status
                        ? Text("")
                        : (locator<ProductViewModel>().category_products.isEmpty
                            ? emptyContentList("No ${widget.category_title} Product Available")
                            : productTable(context, locator<ProductViewModel>().category_products)),
                  ),
                ),
              ])
        ],
      ),
      //bottomNavigationBar: bottomNavBar(context,1),
    );
  }

  fetchCategory() async {
    progressDialog.show();
    var response =
        await locator<ProductViewModel>().getProductsCategory(user.id, user.token);
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
