import 'package:flutter/material.dart';
import 'package:projet32/App/landing_page.dart';

class PreHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Livreur Maroc'),
        actions: [
          FlatButton(
              child: Text(
                'Log In',
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                ),
              ),
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => LandingPage()
                    )
                  );
              },
          )
        ],
      ),
    );
  }
}