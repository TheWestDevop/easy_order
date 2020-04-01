part of 'product.dart';


class ProductView extends StatefulWidget {
  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {  

  @override
  Widget build(BuildContext context) {
  return ScopedModelDescendant<CartViewModel>(
          builder: (context,child,model){
            return Scaffold(
                resizeToAvoidBottomPadding: false,
                appBar: appBarField(context,'/',Constant.avaliableProduct),
                body: productTable(context,model.itemListing),
       );
   }
  );  
}

}
