

import 'dart:async';
import 'dart:io';


import 'package:rxdart/rxdart.dart';


class HomeBloc extends BaseBloc {

  final _userName = BehaviorSubject<String>();
  final _userPhone = BehaviorSubject<String>();
  final _userEmail = BehaviorSubject<String>();
  final _userAvatar = BehaviorSubject<File>();
  final _userAddress = BehaviorSubject<String>();
  final _userStore = BehaviorSubject<String>();
  final _userOrderType = BehaviorSubject<int>();
  final _userNote = BehaviorSubject<String>();

 Stream<String> get userEmail => _userEmail.stream.transform(vaildateUserEmail);
 Stream<String> get userPhone => _userPhone.stream.transform(vaildateUserPhone);
 Stream<String> get userName => _userName.stream.transform(vaildateUserName);
 Stream<File> get userAvatar => _userAvatar.stream.transform(vaildateUserAvatar);
 Stream<String> get userAddress => _userAddress.stream.transform(vaildateUserAddress);
 Stream<String> get userStore => _userStore.stream.transform(vaildateUserStore);
 Stream<String> get userNote => _userNote.stream.transform(vaildateUserNote);
 Stream<int> get userOrderType => _userOrderType.stream.transform(vaildateUserOrderType);

 Stream<bool> get dataValid => Rx.combineLatest2(userEmail, userPhone,(userEmail,userPhone)=>true);

 String get email => _userEmail.value;
 String get phone => _userPhone.value;
 String get name => _userEmail.value;
 File get  avatar => _userAvatar.value;
String get address => _userAddress.value;
String get store => _userStore.value;
String get note => _userNote.value;
int get ordertype => _userOrderType.value;



 Function(String) get changeUserEmail => _userEmail.sink.add;
 Function(String) get changeUserPhone => _userPhone.sink.add;
 Function(String) get changeUserName => _userName.sink.add;
 Function(String) get changeUserAddress => _userAddress.sink.add;
 Function(File) get changeUserAvatar => _userAvatar.sink.add;
 Function(String) get changeUserStore => _userStore.sink.add;
 Function(String) get changeUserNote => _userNote.sink.add;
 Function(int) get changeUserOrderType => _userOrderType.sink.add;

 

final vaildateUserEmail = StreamTransformer<String,String>.fromHandlers(
  handleData:(userEmail,sink){
    Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if(userEmail == null || userEmail == "" || !regex.hasMatch(userEmail)){
       sink.addError("Invalid Email");
    }else{
      sink.add(userEmail);
    }
  }
);
final vaildateUserPhone = StreamTransformer<String,String>.fromHandlers(
  handleData:(userPhone,sink){
    if(userPhone == null || userPhone == "" || userPhone.length < 14){
       sink.addError("Invalid Phone Number");
    }else{
      sink.add(userPhone);
    }
  }
);
final vaildateUserName = StreamTransformer<String,String>.fromHandlers(
  handleData:(userName,sink){
    if(userName == null || userName == "" || userName.length < 10){
       sink.addError("Full Name Needed");
    }else{
      sink.add(userName);
    }
  }
);
final vaildateUserAddress = StreamTransformer<String,String>.fromHandlers(
  handleData:(userAddresss,sink){
    if(userAddresss == null || userAddresss == "" || userAddresss.isEmpty){
       sink.addError("Delivery Address Needed");
    }else{
      sink.add(userAddresss);
    }
  }
);
final vaildateUserAvatar = StreamTransformer<File,File>.fromHandlers(
  handleData:(userAvatar,sink){
    if(userAvatar == null){
       sink.addError("User Picture Needed");
    }else{
      sink.add(userAvatar);
    }
  }
);
final vaildateUserStore = StreamTransformer<String,String>.fromHandlers(
  handleData:(userStore,sink){
      sink.add(userStore);
  }
);
final vaildateUserNote = StreamTransformer<String,String>.fromHandlers(
  handleData:(userNote,sink){
      if(userNote == null || userNote == "" || userNote.isEmpty){
       sink.addError("Orders Needed");
    }else{
      sink.add(userNote);
    }
  }
);
final vaildateUserOrderType = StreamTransformer<int,int>.fromHandlers(
  handleData:(userOrderType,sink){
    if(userOrderType == null || userOrderType == "" || userOrderType == 0){
       sink.addError("Specify your order type");
    }else{
      sink.add(userOrderType);
    }
  }
);

  
 @override
 void dispose(){
   _userEmail?.close();
   _userPhone?.close();
   _userName?.close();
   _userAddress?.close();
   _userAvatar?.close();
   _userStore?.close();
   _userOrderType?.close();
   _userNote?.close();
 }


}

abstract class BaseBloc {
  void dispose();
}