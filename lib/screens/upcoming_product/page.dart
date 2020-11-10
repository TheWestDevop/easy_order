part of 'upcoming_product.dart';

class UpcomingProductView extends StatefulWidget {
  final List<UpcomingProduct> products;
  final String title;


  const UpcomingProductView({Key key, @required this.products, @required this.title}) : super(key: key);
  
  @override
  _UpcomingProductViewState createState() => _UpcomingProductViewState();
}

class _UpcomingProductViewState extends State<UpcomingProductView> {
 
  var items = List<UpcomingProduct>();

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
        appBar: pageAppBar(context, widget.title),
        body: upcomingProductTable(context, items),
        //bottomNavigationBar:bottomNavBar(context,0),
      );
    });
  }
  
}
