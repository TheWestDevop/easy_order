part of 'cart.dart';


class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {  
  @override
  Widget build(BuildContext context) {


   return  ScopedModelDescendant<CartViewModel>(
          builder: (context,child,model){
      return Scaffold(
                resizeToAvoidBottomPadding: false,  
                appBar: appBarField(context,'/products',Constant.cartItem),
                body: cartList(model),
                bottomNavigationBar: checkoutBottomNavigation(context,model),
       );
   }    
  );
}
}



  