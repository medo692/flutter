import 'package:flutter/material.dart';
import 'package:projet32/App/Sign%20In/sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projet32/App/home_page.dart';
import 'package:projet32/services/auth.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen:  false);
    return StreamBuilder<User>(
      stream: auth.authStateChanges(),
      builder: (context,snapshot){
        if (snapshot.connectionState == ConnectionState.active){
         final User user = snapshot.data;
         if (user == null) {
           return SignInPage.create(context);
         }
         return HomePage();
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
