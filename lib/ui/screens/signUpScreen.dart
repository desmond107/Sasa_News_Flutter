import 'package:flutter/material.dart';
import 'package:newsapp/ui/screens/home_screen.dart';
import 'package:newsapp/viewmodels/signUpViewModel.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    SignUpViewModel signUpViewModel = Provider.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () => Navigator.of(context).pop(true),
              child: Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.fromLTRB(10, 40, 0, 0),
                child: Icon(Icons.arrow_back),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text("Sign Up",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text("Fill in the details and create your account",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: Colors.grey)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 60, 30, 0),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.only(top: 20), // add padding to adjust text
                  isDense: true,
                  hintText: "User Name",
                  prefixIcon: Padding(
                    padding:
                        EdgeInsets.only(top: 15), // add padding to adjust icon
                    child: Icon(Icons.account_circle),
                  ),
                ),
                onChanged: (value) => signUpViewModel.saveName(value),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.only(top: 20), // add padding to adjust text
                  isDense: true,
                  hintText: "Email",
                  prefixIcon: Padding(
                    padding:
                        EdgeInsets.only(top: 15), // add padding to adjust icon
                    child: Icon(Icons.email),
                  ),
                ),
                onChanged: (value) => signUpViewModel.changeEmail(value),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.only(top: 20), // add padding to adjust text
                  isDense: true,
                  hintText: "Password",
                  prefixIcon: Padding(
                    padding:
                        EdgeInsets.only(top: 15), // add padding to adjust icon
                    child: Icon(Icons.lock_open),
                  ),
                ),
                onChanged: (value) => signUpViewModel.chnagePassword(value),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.only(top: 20), // add padding to adjust text
                  isDense: true,
                  hintText: "Forgot Password",
                  prefixIcon: Padding(
                    padding:
                        EdgeInsets.only(top: 15), // add padding to adjust icon
                    child: Icon(Icons.lock_open),
                  ),
                ),
                onChanged: (value) => signUpViewModel.confirmPaasowrd(value),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 60, 0, 10),
              child: Center(
                child: ButtonTheme(
                  minWidth: 170.0,
                  height: 40.0,
                  child: RaisedButton(
                    elevation: 5,
                    animationDuration: Duration(seconds: 20),
                    splashColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18),
                    ),
                    color: Colors.blue,
                    onPressed: () async {
                      bool isSuccessful =
                          await signUpViewModel.postSignUpDetails();
                      if (!isSuccessful) {
                        return;
                      } else {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomeScreen()));
                      }
                    },
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
