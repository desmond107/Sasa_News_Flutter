import 'package:flutter/material.dart';
import 'package:newsapp/ui/screens/loginScreen.dart';
import 'package:newsapp/viewmodels/blogViewModel.dart';
import 'package:provider/provider.dart';

import 'viewmodels/signUpViewModel.dart';
import 'viewmodels/validateLogin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ValidateLoginModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignUpViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => BlogViewModel(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: LoginScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
