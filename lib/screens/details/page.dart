

part of 'details.dart';

class DetailsPage extends StatefulWidget{


  Product detail;
  DetailsPage({@required this.detail});

  @override
  State<StatefulWidget> createState() {

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
          appBar: appBarField(context,Constant.productDetail),
          body:Container(
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        color: Colors.grey[300],
                        width: 1.0
                    )
                )
            ),
            child: ListView(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: 280.0,
                      padding: EdgeInsets.only(top: 10.0),
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 200.0,
                            child: PageView(
                              controller: _controller,
                              onPageChanged: (index){
                                print(index);
                                setState(() {
                                                                  active = index;
                                                                });
                                                              },
                                                              children: <Widget>[
                                                                cacheImage(widget.detail.image),
                                                                cacheImage(widget.detail.image),
                                                                cacheImage(widget.detail.image),
                                                                cacheImage(widget.detail.image)
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(height: 10.0,),
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: <Widget>[
                                                              buildDot(active,0),
                                                              buildDot(active,1),
                                                              buildDot(active,2),
                                                              buildDot(active,3)
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                        height: 270.0,
                                                        alignment: Alignment(1.0, 1.0),
                                                        child: Padding(
                                                          padding: EdgeInsets.only(right: 15.0),
                                                          child: Column(
                                                            verticalDirection: VerticalDirection.down,
                                                            crossAxisAlignment: CrossAxisAlignment.end,
                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                            children: <Widget>[
                                                              
                                                                GestureDetector(
                                                                    onTap: (){
                                                                      print(widget.detail);
                                                                      model.addToFav(widget.detail);
                                                                      showSnak(widget.detail.fav,widget.detail.title);
                                                                    },
                                                                    child: widget.detail.fav ? Icon(Icons.favorite,size: 20.0,color: Colors.red,) : Icon(Icons.favorite_border,size: 20.0,),
                                                                  )
                                                
                                                            ],
                                                          ),
                                                        )
                                                    )
                                                  ],
                                                ),
                                                Divider(color: Colors.grey[300],height: 1.0,),
                                                Container(
                                                  padding: EdgeInsets.symmetric(horizontal: 50.0,vertical: 20.0),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      Text(widget.detail.title,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 19.0,color: Colors.deepPurple[900])),
                                                      Padding(
                                                        padding: EdgeInsets.only(top: 10.0),
                                                        child: Text(widget.detail.description,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 19.0,color: Colors.deepPurple[900])),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
          bottomNavigationBar: productDetailsBottomNavigation(widget.detail,model,showCartSnak),
        ),
    );
  }
  );
  }

}
