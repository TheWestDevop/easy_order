part of 'otp.dart';

class OTP_Page extends StatefulWidget {
  @override
  _OTP_PageState createState() => _OTP_PageState();
}

class _OTP_PageState extends State<OTP_Page> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
    //  appBar: authAppBar(context,''),
     body: Column(
       crossAxisAlignment: CrossAxisAlignment.stretch,
       children:<Widget>[
        //SizedBox(height:20.0,),
        otpLabel(),
        otpField(context)]
     ),
    );
  }
}