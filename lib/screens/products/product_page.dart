part of 'product.dart';

class ProductView extends StatefulWidget {
  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final productViewModel = locator<ProductViewModel>();


  var account;
  var items = List<Product>();

  @override
  void initState() {
    items.addAll(productViewModel.products);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProductViewModel>(
        builder: (context, child, model) {
      return Scaffold(
        resizeToAvoidBottomPadding: false,
       // appBar: homebar(context, Constant.avaliableProduct),
        body: productTable(context, items),
        //bottomNavigationBar:bottomNavBar(context,0),
      );
    });
  }
  
}
