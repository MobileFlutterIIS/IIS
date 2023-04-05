
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserProfile {
  final String usernameRes;
  final String fio;
  final String phoneNumber;
  final String email;
  final String group;

  UserProfile({
    required this.usernameRes,
    required this.fio,
    required this.phoneNumber,
    required this.email,
    required this.group,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json){
    return UserProfile(
        usernameRes: json['usernameRes'],
        fio: json['fio'],
        phoneNumber: json['phoneNumber'],
        email: json['email'],
        group: json['group']
    );
  }

  Map<String,dynamic> toJson() {
    return {
      'usernameRes':usernameRes,
      'fio':fio,
      'phoneNumber':phoneNumber,
      'email':email,
      'group':group,
    };
  }
}

// var response;
//
// postData(String username, String password) async{
//   try {
//     response = http.post(
//         Uri.parse("https://iis.bsuir.by/api/v1/"),
//         body: {
//           "username": username,
//           "password": password
//         }
//     );
//   } catch (e) {
//     print(e);
//   }
// }
//
// String cookies = response.headers['Cookie'];
// String key = jsonDecode(response.body['key']);
//
//
//
//
//
//

//Future<UserProfile?> getUserProfile(String username, String password) async {
//   try {
//
//     final postResponse = await http.post(
//       Uri.parse('https://iis.bsuir.by/api/v1/auth/login'),
//       body: {
//         "username" : username,
//         "password" : password,
//       },
//       headers: headers
//     );
//
//     print(postResponse.statusCode);
//
//     if (postResponse.statusCode == 200) {
//       final presponse = await http.get(Uri.parse('https://iis.bsuir.by/api/v1/profiles/personal-cv'));
//       final cookies = presponse.headers['set-cookie'];
//       String cookieValue = '';
//       if (cookies != null) {
//         int index = cookies.indexOf(';');
//         cookieValue = (index == -1) ? cookies : cookies.substring(0, index);
//         presponse.headers['cookie'] = cookieValue;
//       }
//       print('B O D Y');
//       print(presponse.body);
//       final getResponse;
//       if(cookies!=null) {
//         getResponse = await http.get(
//           Uri.parse('https://iis.bsuir.by/api/v1/profiles/personal-cv'),
//           headers: {
//             'cookie': cookieValue
//           },
//
//         );
//       }
//       else{
//         getResponse = null;
//       }
//       print(getResponse.body);
//
//       print(getResponse.statusCode);
//       if (getResponse.statusCode == 200) {
//         print('cccccccccccccccccccccc');
//         final json = jsonDecode(getResponse.body);
//         final userProfile = UserProfile.fromJson(json);
//         print('aaaaaaaaaaaaaaaaa');
//         return userProfile;
//       }
//     }
//   } catch (e) {
//     print('foo');
//   }
//   print('aa');
//   return null;
// }


class Session {
  Map<String, String> headers = {};

  void updateCookie(http.Response response) {
    String rawCookie = response.headers['set-cookie']!;
    if (rawCookie != null) {
      int index = rawCookie.indexOf(';');
      headers['cookie'] =
      (index == -1) ? rawCookie : rawCookie.substring(0, index);
    }
  }

  Future<Map> get(String url) async {
    http.Response response = await http.get(
        Uri.parse(url),
        headers: headers
    );
    updateCookie(response);
    return json.decode(response.body);
  }

  Future<Map> post(String url, dynamic data) async{
    http.Response response = await http.post(
      Uri.parse(url),
      body: data,
      headers: headers,
    );
    updateCookie(response);
    return json.decode(response.body);
  }
}

Map getData(String uname, String passw) {
  Map data = {
    'username' : uname,
    'password' : passw,
  };
  return data;
}
