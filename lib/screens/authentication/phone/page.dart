part of 'phone.dart';

class Phone_Page extends StatefulWidget {
  @override
  PageState createState() => PageState();
}

class PageState extends State<Phone_Page> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: authAppBarField(context,''),
     body: Column(
       crossAxisAlignment: CrossAxisAlignment.stretch,
       children:<Widget>[
        //SizedBox(height:70.0,),
        phoneAuthLabel(),
        SizedBox(height:40.0,),
        Padding(
          padding: const EdgeInsets.fromLTRB(25.0,0,25.0,0),
          child: phoneAuthField(context),
        )
        ]
     ),
    );
  }
}