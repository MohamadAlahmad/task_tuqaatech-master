import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:task_tuqaatech/model/city.dart';
import 'package:task_tuqaatech/model/country.dart';
import 'package:http/http.dart' as http_connection;
import 'package:task_tuqaatech/model/login.dart';
import 'package:task_tuqaatech/model/register.dart';
import 'package:task_tuqaatech/utilities/global.dart';
import 'package:task_tuqaatech/utilities/shared.dart';

class MyConnectionController {
  static const String _baseUrl = 'mobiletest.tuqaatech.com';
  static const String _register = '/api/services/app/Account/Register';
  static const String _getAllCities = '/api/services/app/City/GetAllCities';
  static const String _getAllCountries =
      '/api/services/app/Country/GetAllCountries';
  static const String _login = '/api/TokenAuth/Authenticate';
  static const String _firebaseToken =
      '/api/services/app/User/InsertFireBaseToken';
  static const String _partnerImage =
      '/api/services/app/UserInformation/DownloadImage/';
  static const String _partnerCities =
      '/api/services/app/CityPartner/GetAllCityPartners';
  static const String _postChat = '/api/services/app/Chat/PostChat';
  static const String _chatList = '/api/services/app/Chat/GetAllChatList';
  static const String _chatDialoug = '/api/services/app/Chat/GetDialogByChatId';
  static const String _getDialogByChatIdskip =
      '/api/services/app/Chat/GetDialogByChatIdskip';

  static Future<List<Country>> getCountries() async {
    try {
      var uri = Uri.https(_baseUrl, _getAllCountries);
      var response = await http_connection.get(
        uri,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      ).timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        CountryModel model = CountryModel.fromJson(json.decode(response.body));
        return model.result;
      } else {
        CountryModel model = CountryModel.fromJson(json.decode(response.body));
        throw '${MyStrings.error} : ${model.error}';
      }
    } catch (e) {
      throw '${MyStrings.error} : ${e.toString()}';
    }
  }

  static Future<List<City>> getCities() async {
    try {
      var uri = Uri.https(_baseUrl, _getAllCities);
      var response = await http_connection.get(
        uri,
        headers: {
          "Content-Type": "application/x-www-form-urlencoded ;charset=utf-8",
        },
      ).timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        CityModel model = CityModel.fromJson(json.decode(response.body));
        return model.result;
      } else {
        CityModel model = CityModel.fromJson(json.decode(response.body));
        throw '${MyStrings.error} : ${model.error}';
      }
    } catch (e) {
      throw '${MyStrings.error} : ${e.toString()}';
    }
  }

  // "name": "string",
  // "gender": 0,
  // "age": 0,
  // "cityId": 0,
  // "countryId": 0,
  // "phoneNumber": "string",
  // "emailAddress": "user@example.com",
  // "password": "string",
  // "avatar": "string"

  static Future<bool> signup(
      {required String name,
      required int gender,
      required int age,
      required int cityId,
      required int countryId,
      required String phoneNumber,
      required String emailAddress,
      required String password,
      required String avatar}) async {
    Map<String, dynamic> data = {
      "name": name.toString(),
      "gender": gender.toString(),
      "age": age.toString(),
      "cityId": cityId.toString(),
      "countryId": countryId.toString(),
      "phoneNumber": phoneNumber.toString(),
      "emailAddress": emailAddress.toString(),
      "password": password.toString(),
      "avatar": 'data:image/jpeg;base64,' + avatar.toString(),
    };

    try {
      var uri = Uri.https(_baseUrl, _register);
      var response = await http_connection
          .post(uri,
              headers: {
                "Content-Type": "application/json",
              },
              body: json.encode(data))
          .timeout(const Duration(seconds: 30));
      if (response.statusCode == 200) {
        RegisterModel model =
            RegisterModel.fromJson(json.decode(response.body));
        return model.result!.canLogin;
      } else {
        // Error errorModel = Error.fromJson(json.decode(response.body));
        throw 'Error';
      }
    } catch (e) {
      throw '${MyStrings.error} : ${e.toString()}';
    }
  }

//   {
//   "userNameOrEmailAddress": "string",
//   "password": "string",
//   "rememberClient": true
// }
  static Future<bool> signin({
    required String userNameOrEmailAddress,
    required String password,
    required bool rememberClient,
  }) async {
    Map<String, dynamic> data = {
      "userNameOrEmailAddress": userNameOrEmailAddress,
      "password": password,
      "rememberClient": rememberClient
    };
    try {
      var uri = Uri.https(_baseUrl, _login);
      var response = await http_connection
          .post(uri,
              headers: {
                "Content-Type": "application/json",
              },
              body: json.encode(data))
          .timeout(const Duration(seconds: 30));
      if (response.statusCode == 200) {
        LoginModel model = LoginModel.fromJson(json.decode(response.body));
        await insertFirebaseToken();
        MyShared.save(loginModel: model);
        return true;
      } else {
        // Error errorModel = Error.fromJson(json.decode(response.body));
        throw 'Error';
      }
    } catch (e) {
      throw '${MyStrings.error} : ${e.toString()}';
    }
  }

// {
//  "firebaseToken":"xzxz"
// }
  static Future<bool> insertFirebaseToken() async {
    String? firebaseToken = await FirebaseMessaging.instance.getToken();
    try {
      if (firebaseToken != null) {
        Map<String, dynamic> data = {"firebaseToken": firebaseToken};
        var uri = Uri.https(_baseUrl, _firebaseToken);
        var response = await http_connection
            .post(uri,
                headers: {
                  "Content-Type": "application/json",
                },
                body: json.encode(data))
            .timeout(const Duration(seconds: 30));
        if (response.statusCode == 200) {
          return true;
        } else {
          // Error errorModel = Error.fromJson(json.decode(response.body));
          throw 'Error';
        }
      } else {
        throw 'Error';
      }
    } catch (e) {
      throw '${MyStrings.error} : ${e.toString()}';
    }
  }
}
