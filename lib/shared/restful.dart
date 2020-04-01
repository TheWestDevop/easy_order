import 'package:http/http.dart' as connect;

class API {

  Future Post({url,data}) async {
    
    final response = await connect.post(url,body:data);

    return Future.value(response);
  }

  Future Get({url}) async {
    
    final response = await connect.post(url);

    return Future.value(response);
  }

  Future Put({url,data}) async {
    
    final response = await connect.put(url,body:data);

    return Future.value(response);
  }

  Future Patch({url,data}) async {
    
    final response = await connect.patch(url,body:data);

    return Future.value(response);
  }

  Future Delete({url}) async {
    
    final response = await connect.delete(url);

    return Future.value(response);
  }

}