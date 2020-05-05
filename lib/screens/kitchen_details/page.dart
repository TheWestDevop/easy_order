

part of 'kitchen.dart';

class KitchenDetailsPage extends StatefulWidget{


  Kitchen detail;
  KitchenDetailsPage({@required this.detail});

  @override
  State<StatefulWidget> createState() {

    return KitchenDetailsPageState();
  }
}

class KitchenDetailsPageState extends State<KitchenDetailsPage>{
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  PageController _controller;
  int active =0;
  String _kitchenName;
  String _bookingCost;

  

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
    
    return  ScopedModelDescendant<KitchenViewModel>(
          builder: (context,child,model){
            return  SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.white,
          appBar: appBarField(context,Constant.kitchenDetail),
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
                                                  padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      Container(
                                                            child: Row(
                  
                                                              children: <Widget>[
                                                                Container(
                                                                 
                                                                  child: Text("Kitchen Name - ",style: TextStyle(fontSize: 20.0,color: Colors.grey),),
                                                                ),
                                                                Text("${widget.detail.title}",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w600,color: Colors.deepPurple[900])),
                                                              ],
                                                            ),
                                                          ),
                                                      SizedBox(height:20.0),
                                                      Container(
                                                            child: Row(
                                                              children: <Widget>[
                                                                Container(
                                                                  //width: 60.0,
                                                                  child: Text("Kitchen Location - ",style: TextStyle(fontSize: 20.0,color: Colors.grey),),
                                                                ),
                                                                Text("${widget.detail.location}",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w600,color: Colors.deepPurple[900])),
                                                              ],
                                                            ),
                                                          ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
          bottomNavigationBar: kitchenDetailsBottomNavigation(model,showCartSnak),
        ),
    );
  }
  );
  }

  Widget priceDropdown(){
   //print("money format :- ${formatMoney(500)}");
  List<String> _book_costs = ['30minute - ${formatMoney(500)}', '1hr - ${formatMoney(900)}', '1hr 30min - ${formatMoney(1400)}', '2hr - ${formatMoney(1700)}']; // Option 2
  return Center(
          child: DropdownButton(
            hint: Text('Please choose a book price'), // Not necessary for Option 1
            value: _bookingCost,
            onChanged: (newValue) {
              setState(() {
                _bookingCost = newValue;
              });
            },
            items: _book_costs.map((cost) {
              return DropdownMenuItem(
                child: new Text(cost,style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w600,color: Colors.deepPurple[900])),
                value: cost,
              );
            }).toList(),
          ),
        );
}
  
  Widget kitchenDetailsBottomNavigation(KitchenViewModel viewModel,Function showCartSnak){
  return Container(
              margin: EdgeInsets.only(bottom: 18.0),
              height: 60.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      top: BorderSide(color: Colors.grey[300],width: 1.0)
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        priceDropdown()//Text("\#500",style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w600,color: Colors.deepPurple[900])),
                      ],
                    ),
                  ),
                  
                RaisedButton(
                        color: Colors.deepOrange,
                        onPressed: (){
                          // viewModel.addCart(item);
                          // Timer(Duration(milliseconds: 500), (){
                          //   showCartSnak(viewModel.cartMessage,viewModel.success);
                          // });
                        },
                        child: Text("Book",style: TextStyle(color: Colors.white),),
                      )
            
                  
                ],
              )
          );
}

}
