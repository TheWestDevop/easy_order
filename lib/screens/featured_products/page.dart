part of 'featured_product.dart';

class FeaturedProductView extends StatefulWidget {
  final List<Product> products;
  final String title;


  const FeaturedProductView({Key key, @required this.products, @required this.title}) : super(key: key);
  
  @override
  _FeaturedProductViewState createState() => _FeaturedProductViewState();
}

class _FeaturedProductViewState extends State<FeaturedProductView> {
 
  var items = List<Product>();

  @override
  void initState() {
    items.addAll(widget.products);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProductViewModel>(
        builder: (context, child, model) {
      return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: specialPageAppBar(context, widget.title,"/search/product"),
        body: productTable(context, items),
        //bottomNavigationBar:bottomNavBar(context,0),
      );
    });
  }
  
}
