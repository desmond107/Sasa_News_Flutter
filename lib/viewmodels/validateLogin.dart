import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/utils/constants.dart' as constants;
import 'package:newsapp/logic/models/loginResponseModel.dart';
import 'package:newsapp/logic/models/validateLoginDetailsModel.dart';
import 'package:newsapp/utils/apiCall.dart';

enum LoginState { Idle, Busy, Error }

class ValidateLoginModel with ChangeNotifier {
  LoginState _loginState = LoginState.Idle;
  String emailInput;
  String passInput;
  bool isSuccess = false;

  void setLoginState(LoginState loginState) {
    _loginState = loginState;
    notifyListeners();
  }

  LoginState get getLoginState => _loginState;

  Future<bool> postLoginDetails() async {
    if (isValid) {
      setLoginState(LoginState.Busy);
      try {
        Map<String, String> hashmap = {
          "email": emailInput,
          "password": passInput
        };

        http.Response response =
            await ApiCall().sendPost(constants.login, hashmap);

        if (response.statusCode == 200) {
          LoginResponseModel _loginResponse =
              LoginResponseModel.fromJson(json.decode(response.body));

          if (_loginResponse.isSuccessful) {
            isSuccess = true;
          }
        } else {
          print("failed");
        }
      } catch (error) {
        print(error);
      }
    } else {
      print("not valid");
    }
    setLoginState(LoginState.Idle);
    print(isSuccess);
    return isSuccess;
  }

  ValidateLoginDetail _email = ValidateLoginDetail(null, null);
  ValidateLoginDetail _password = ValidateLoginDetail(null, null);

  //Getters
  ValidateLoginDetail get email => _email;
  ValidateLoginDetail get password => _password;

  bool get isValid {
    if (_email.value != null && _password.value != null) {
      emailInput = _email.value;
      passInput = _password.value;
      return true;
    } else {
      return false;
    }
  }

//Setters
  void changeEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (regex.hasMatch(value)) {
      _email = ValidateLoginDetail(value, null);
    } else {
      _email = ValidateLoginDetail(null, "Must be at least 3 characters");
    }
    notifyListeners();
  }

  void chnagePassword(String value) {
    if (value.length >= 3) {
      _password = ValidateLoginDetail(value, null);
    } else {
      _password = ValidateLoginDetail(null, "Must be at least 4 characters");
    }
    notifyListeners();
  }

  void submitData() {}

  bool get isSuccessful => isSuccess;
}
