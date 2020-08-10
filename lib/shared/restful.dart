import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as connect;

class API {
  Future Post(url, data, [authToken]) async {
    print("sending POST request to $url ");

    final response = await connect.post(url,
        body: data, headers: {HttpHeaders.authorizationHeader: authToken});

    return Future.value(json.decode(response.body));
  }

  Future Get(url,[authToken]) async {

    print("sending GET request to $url");

    final response = await connect.get(url,headers: {HttpHeaders.authorizationHeader:authToken});
    
    print("get response is $response");

    return Future.value(json.decode(response.body));
  }

  Future Put(url, data,[authToken]) async {

    print("sending PUT  request to $url");
       

    final response = await connect.put(url,
        body: data, headers: {HttpHeaders.authorizationHeader: authToken});

    return Future.value(json.decode(response.body));
  }

  Future Patch(url, data,[authToken]) async {

    print("sending PATCH request to $url");


    final response = await connect.patch(url, body: data,headers: {HttpHeaders.authorizationHeader:authToken});

    return Future.value(json.decode(response.body));
  }

  Future Delete(url,[authToken]) async {

    print("sending DELETE request to $url");

    final response = await connect.delete(url,headers: {HttpHeaders.authorizationHeader:authToken});
    
    return Future.value(json.decode(response.body));
  }
}
