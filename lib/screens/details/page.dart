

part of 'details.dart';

class DetailsPage extends StatefulWidget{


  Product detail;
  DetailsPage({@required this.detail});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DetailsPageState();
  }
}

class DetailsPageState extends State<DetailsPage>{
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  PageController _controller;
  int active =0;

  

  showSnak(bool flag,String name){
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(flag ? "${name} added in favourite list" : "${name} removed from favourite list"),
          duration: Duration(seconds: 2),
        ));
  }

  showCartSnak(String msg,bool flag){
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(msg,style: TextStyle(color: Colors.white),),
          backgroundColor: (flag) ? Colors.green : Colors.red[500] ,
          duration: Duration(seconds: 2),
        ));
  }

  @override
  Widget build(BuildContext context) {
    
    return  ScopedModelDescendant<CartViewModel>(
          builder: (context,child,model){
            return  SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.white,
          appBar: appBarField(context,'/products',Constant.productDetail),
          body:productDetails(widget.detail,_controller,model,active,showSnak,setState),
          bottomNavigationBar: productDetailsBottomNavigation(widget.detail,model,showCartSnak),
        ),
    );
  }
  );
  }

}
