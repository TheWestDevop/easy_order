
import 'package:fluttertoast/fluttertoast.dart';


Future<bool> ToastOn(msg,bgColors,txtColors,fontSize){
        return Fluttertoast.showToast(
                msg: msg,
                toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 5,
          backgroundColor: bgColors,
          textColor: txtColors,
          fontSize: fontSize
      );
}