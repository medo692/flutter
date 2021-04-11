import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projet32/App/Sign%20In/email_sign_in_page.dart';
import 'package:projet32/App/Sign%20In/sign_in_bloc.dart';
import 'package:projet32/App/Sign%20In/sign_in_button.dart';
import 'package:projet32/App/Sign%20In/sosial_sign_in_button.dart';
import 'package:projet32/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:projet32/conmmon_wedjet/show_exeption_alert_dialog.dart';

class SignInPage extends StatelessWidget {
  static Widget create(BuildContext context){
    return Provider <SignInBloc>(
      create: (_)=> SignInBloc(),
      child: SignInPage(),
    );
  }

  void _showSignInError(BuildContext context, Exception exception){
    if (exception is FirebaseException && exception.code == 'ERROR ABORTED BY USER'){
      return;
    }
    showExeptionAlertDialog(
      context,
      title: 'Sign In Failed',
      exception: exception,
    );
}
  Future<void> _signInWithGoogle(BuildContext context) async{
    final bloc = Provider.of<SignInBloc>(context,listen: false);
    try {
      bloc.setIsLoading(true);
      final auth = Provider.of<AuthBase>(context, listen:  false);
      await auth.signInWithGoogle();
    } on Exception catch (e) {
      _showSignInError(context,e);
    }finally {
      bloc.setIsLoading(false);
    }
  }

  Future<void> _signInWithFacebook(BuildContext context) async{
    final bloc = Provider.of<SignInBloc>(context,listen: false);
    try {
      bloc.setIsLoading(true);
      final auth = Provider.of<AuthBase>(context, listen:  false);
      await auth.signInWithFacebook();
    } on Exception catch (e) {
      _showSignInError(context,e);
    }finally {
      bloc.setIsLoading(false);
    }
  }
  void _signInWithEmail(BuildContext context){
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (context)=> EmailSignInPage(),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<SignInBloc>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Livreur Maroc'),
        elevation: 2.0,
      ),
      body: StreamBuilder<bool>(
        stream: bloc.isLoadingStream,
        initialData: false,
        builder: (context, snapshot) {
          return _buildContent(context, snapshot.data);
        }
      ),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContent (BuildContext context, bool isLoading) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
              height: 50.0,
              child: _buildHeader(isLoading),
          ),
          SizedBox(height: 48.0),
          SocialSignInButton(
            assetName: 'images/google-logo.png',
            text: 'Sign In with Google',
            textColor: Colors.black87,
            color: Colors.white,
            onPressed: isLoading ? null : ()=> _signInWithGoogle(context),
          ),
          SizedBox(height: 8.0),
          SocialSignInButton(
            assetName: 'images/facebook-logo.png',
            text: 'Sign In with Facebook',
            textColor: Colors.white,
            color: Color(0xFF334D92),
            onPressed: isLoading ? null : ()=>_signInWithFacebook(context),
          ),
          SizedBox(height: 8.0),
          SignInButton(
            text: 'Sign In with email',
            textColor: Colors.white,
            color: Colors.teal[700],
            onPressed: isLoading ? null : ()=> _signInWithEmail(context),
          ),
        ],
      ),
    );
  }
  Widget _buildHeader(bool isLoading){
    if (isLoading){
     return Center(
       child: CircularProgressIndicator(),
     );
    }
    return Text(
      'Sign In',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
