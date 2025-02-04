import 'package:easy_order/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:easy_order/shared/shared.dart';

class Error extends StatefulWidget {
  @override
  _ErrorState createState() => _ErrorState();
}

class _ErrorState extends State<Error> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      //appBar: authAppBarField(context,),
     body: Column(
       crossAxisAlignment: CrossAxisAlignment.stretch,
       children:<Widget>[
        //SizedBox(height:20.0,),
        Container(
          child:Stack(
            children: <Widget>[
             Container(
              padding: EdgeInsets.fromLTRB(15.0,110.0,0.0,0.0),
              child: Text(
                'Ooh sorry page not found',
                style:TextStyle(
                  fontSize:30.0,fontWeight:FontWeight.bold)
                ),
              ),
              Container(
              padding: EdgeInsets.fromLTRB(15.0,175.0,0.0,0.0),
              child: Text(
                'Error',
                style:TextStyle(
                  fontSize:50.0,fontWeight:FontWeight.bold)
                ),
              ),
              Container(
              padding: EdgeInsets.fromLTRB(220.0,176.0,0.0,0.0),
              child: Text(
                '.',
                style:TextStyle(
                  fontSize:50.0,fontWeight:FontWeight.bold,color:Constant.getColor("1b4332"))
                ),
              ),

          ],
          )
        )
        ,
        Container(
          padding: EdgeInsets.only(top:35,left:20.0,right:20.0),
          child: Column(
            children:<Widget>[
              SizedBox(height:40.0,),
               Container(
                 height:55.0,
                 child:Material(
                borderRadius:BorderRadius.circular(20.0),
                shadowColor:Constant.getColor("1b4332"),
                color:Constant.getColor("1b4332"),
                elevation:7.0,
                child:GestureDetector(
                  onTap:()=>Navigator.of(context).pushNamed('/login'),
                  child: Center(
                    child:Text(
                      Constant.homelabel,
                      style: TextStyle(
                        //height:2.0,
                        color:Colors.white,
                        fontWeight:FontWeight.bold,
                        fontFamily: 'Montserrat',
                        fontSize:25,
                      ),)
                  ),)
               )
               ),
              SizedBox(height:20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 Text(
                   Constant.goBackLabel,
                   style: TextStyle(
                     fontWeight: FontWeight.bold, 
                     fontFamily:'Montserrat'
                   ),
                 ),
                 SizedBox(width:5.0,),
                 InkWell(
                onTap:()=>Navigator.of(context).pushNamed('/login'),
                child:Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(Constant.loginLabel,
                    style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Montserrat', color: Constant.getColor("1b4332"))),
                    
                  ),
              ),
               ],
              ),
            ],
          ),
        )
       ]
     ),
    );
  }
}