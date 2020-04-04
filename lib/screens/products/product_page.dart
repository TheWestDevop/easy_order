part of 'product.dart';


class ProductView extends StatefulWidget {
  
  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {  
   final profile = locator<AccountViewModel>();

   @override
   void initState() { 
     locator<CartViewModel>().fetchCartList();
     locator<AuthViewModel>().fetchLocalProfile();
     super.initState();
     
   }

  
  
 
  

  @override
  Widget build(BuildContext context) {
  return ScopedModelDescendant<ProductViewModel>(
          builder: (context,child,model){
            return Scaffold(
                resizeToAvoidBottomPadding: false,
                appBar: homebar(context,Constant.avaliableProduct,profile.profile_image),
                body: productTable(context,model.itemListing),
                //bottomNavigationBar:bottomNavBar(context,0),
       );
   }
  );  
}

}
