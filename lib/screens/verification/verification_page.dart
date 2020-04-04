part of 'verification.dart';


class VerificationForm extends StatefulWidget {


  @override
  _VerificationFormState createState() => _VerificationFormState();
}

class _VerificationFormState extends State<VerificationForm> {  

  @override
  Widget build(BuildContext context) {


   return new Scaffold(
              resizeToAvoidBottomPadding: false,
              appBar: appBarField(context,Constant.verificationLabel),
              body: ListView(
     scrollDirection: Axis.vertical,
     children:<Widget>[ 
                    Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:<Widget>[
                  yourPicture(),
                  Container(
                    padding: EdgeInsets.only(top:35,left:20.0,right:20.0),
                    child: Column(
                        children:<Widget>[
                          pictureField(context),
                          SizedBox(height:20.0,),
                          displayPictureField(context),
                          SizedBox(height:40.0,),
                          placeOrderBtn(context),
                         ],
                      ),
                  ),
                  ]
                  )
                ],
              ),
     );    
  }
}


  