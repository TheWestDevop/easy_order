
import 'package:easy_order/shared/shared.dart';
import 'package:easy_order/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:scoped_model/scoped_model.dart';



                     

                      
Widget registerLink(context){
  return  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          Constant.newUserlabel,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily:'Montserrat'
                          ),
                        ),
                        SizedBox(width:5.0,),
                        InkWell(
                        onTap:()=>Navigator.of(context).pushNamed('/register'),
                        child:Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(Constant.registerLabel,
                            style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Montserrat', color: Constant.getColor("1b4332"))),
                            
                          ),
                      ),
                      ],
                      );                   
}

Widget loginHeader(){
 return Container(
          color:Colors.white,
          child:Stack(
            children: <Widget>[
             Container(
              padding: EdgeInsets.fromLTRB(15.0,80.0,0.0,0.0),
              child: Text(
                'Smorfarm',
                style:TextStyle(
                  fontSize:60.0,
                  fontWeight:FontWeight.bold,
                  fontFamily: "Wavehaus"
                  )
                ),
              ),
              Container(
              padding: EdgeInsets.fromLTRB(15.0,145.0,0.0,0.0),
              child: Text(
                'Market',
                style:TextStyle(
                  fontSize:60.0,
                  fontWeight:FontWeight.bold,
                  fontFamily: "Wavehaus"

                  )
                ),
              ),
              Container(
              padding: EdgeInsets.fromLTRB(180.0,101.0,0.0,0.0),
              child: Text(
                '.',
                style:TextStyle(
                  fontSize:60.0,fontWeight:FontWeight.bold,color:Constant.getColor("1b4332"))
                ),
              ),

          ],
          )
        );
}

Widget forgotBtn(context){
  return InkWell(
                        onTap:()=>Navigator.of(context).pushNamed('/forgot'),
                        child:Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(Constant.forgot_password,
                            style: TextStyle(fontWeight: FontWeight.w900, fontFamily: 'Montserrat', color: Constant.getColor("1b4332"))),
                            
                          ),
                          ),
                      );
}


Widget oldUser(String text,context){
  return Row(
                mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 Text(
                   text,
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
              );
}



Widget phoneAuthLabel(){
  return Container(
          child:Stack(
            children: <Widget>[
             Container(
              padding: EdgeInsets.fromLTRB(15.0,60.0,0.0,0.0),
              child: Text(
                'Phone Number',
                style:TextStyle(
                  fontSize:50.0,fontWeight:FontWeight.bold)
                ),
              ),
              Container(
              padding: EdgeInsets.fromLTRB(15.0,125.0,0.0,0.0),
              child: Text(
                'Verification',
                style:TextStyle(
                  fontSize:40.0,fontWeight:FontWeight.bold)
                ),
              ),
              Container(
              padding: EdgeInsets.fromLTRB(210.0,0.0,0.0,0.0),
              child: Text(
                '.',
                style:TextStyle(
                  fontSize:80.0,fontWeight:FontWeight.bold,color:Constant.getColor("1b4332"))
                ),
              ),

          ],
          )
        );
        
}

Widget signUpLabel(){
  return  Container(
          child:Stack(
            children: <Widget>[
              Container(
              padding: EdgeInsets.fromLTRB(15.0,50.0,0.0,0.0),
              child: Text(
                'Sign',
                style:TextStyle(
                  fontSize:80.0,fontWeight:FontWeight.bold)
                ),
              ),
              Container(
              padding: EdgeInsets.fromLTRB(15.0,115.0,0.0,0.0),
              child: Text(
                'Up',
                style:TextStyle(
                  fontSize:80.0,fontWeight:FontWeight.bold)
                ),
              ),
              Container(
              padding: EdgeInsets.fromLTRB(74.0,145.0,0.0,0.0),
              child: Text(
                '.',
                style:TextStyle(
                  fontSize:80.0,fontWeight:FontWeight.bold,color:Constant.getColor("1b4332"))
                ),
              ),

          ],
          )
        );
}          

Widget otpLabel(){
  return Container(
          child:Stack(
            children: <Widget>[
             Container(
              padding: EdgeInsets.fromLTRB(15.0,60.0,0.0,0.0),
              child: Text(
                'OTP',
                style:TextStyle(
                  fontSize:60.0,fontWeight:FontWeight.bold)
                ),
              ),
              Container(
              padding: EdgeInsets.fromLTRB(15.0,125.0,0.0,0.0),
              child: Text(
                'Verification',
                style:TextStyle(
                  fontSize:60.0,fontWeight:FontWeight.bold)
                ),
              ),
              Container(
              padding: EdgeInsets.fromLTRB(26.0,26.0,0.0,0.0),
              child: Text(
                '.',
                style:TextStyle(
                  fontSize:80.0,fontWeight:FontWeight.bold,color:Constant.getColor("1b4332"))
                ),
              ),

          ],
          )
        );
}

AppBar authAppBar(BuildContext context, String title) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(color: Colors.white, fontSize: 16),
    ),
    leading: new IconButton(
        icon: new Icon(
            MaterialCommunityIcons.getIconData("keyboard-backspace"),
            color: Constant.getColor("1b4332"),
            size:50.0,
            ),
        onPressed: () => Navigator.of(context).pop()),
    actions: <Widget>[
      // GestureDetector(
      //   onTap: () => Navigator.of(context).pushNamed('/search'),
      //   child: Icon(
      //     MaterialCommunityIcons.getIconData("magnify"),
      //     color: Colors.white,
      //   ),
      // ),
      Stack(
        children: <Widget>[
          Text('')
        ],
      ),
    ],
    backgroundColor: Colors.white24,
    elevation:0.0,
  );
}

Widget phoneAuthField(context){
  return  Container(
          //padding: EdgeInsets.only(top:35,left:20.0,right:20.0),
          child: Column(
            children:<Widget>[
              TextFormField(
                validator:(val)=>validatePhoneField(val),
                decoration:InputDecoration(
                  prefixIcon: Icon(Icons.phone_iphone,color:Constant.getColor("1b4332")),
                 labelText: Constant.phonePlaceholder,
                 labelStyle: TextStyle(
                   fontFamily:'Montserrat',
                   fontWeight:FontWeight.bold,
                   color:Colors.grey,
                 ),
                 focusedBorder: OutlineInputBorder(borderSide:BorderSide(color:Constant.getColor("1b4332")) )
                )
              ),
              SizedBox(height:40.0,),
               Container(
                 padding: const EdgeInsets.fromLTRB(35.0,0,35.0,0),
                 height:55.0,
                 child:Material(
                borderRadius:BorderRadius.circular(20.0),
                shadowColor:Constant.getColor("1b4332"),
                color:Constant.getColor("1b4332"),
                elevation:7.0,
                child:GestureDetector(
                  onTap:()=>Navigator.of(context).pushNamed('/otp'),
                  child: Center(
                    child:Text(
                      Constant.sendOTPPlaceholder,
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

            ],
          ),
        );
       
}













