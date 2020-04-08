
import 'package:easy_order/models/profile.dart';
import 'package:easy_order/shared/shared.dart';

class AuthService {
  
API _api;

Map<String,dynamic> login(String email,String password){
 var user_data = {
   'status':true,
   'profile':{
     'id':1,
     'name':"oyeniyi adedayo",
     'image':'https://picsum.photos/200/300',
     'phone':'+2348143412400',
     'email':'oyeniyiAdedayo@gmail.com',
     'address':'Osara close, Maitama Wuse 2 Abuja',
    
   }
};
   return user_data;
}

Future<Map<String,dynamic>> register(){
  
  
}

Future<String> phoneAuth(){
  
  
}

Future<Map<String,dynamic>> passwordRecovery(){
  
  
}






}