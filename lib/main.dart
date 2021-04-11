import 'package:firebase_core/firebase_core.dart';
import'package:flutter/material.dart';
import 'package:projet32/App/pre_home_page.dart';
import 'package:projet32/services/auth.dart';
import 'package:provider/provider.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (context)=> Auth(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Livreur Maroc',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: PreHomePage(
        ),
      ),
    );
  }
}
