import 'package:flutter/material.dart';
import 'package:login_logout/Logged_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _auth = FirebaseAuth.instance;
  String _email;
  String _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                _email = value;
              },
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Email address',
                icon: Icon(Icons.email),
              ),
            ),
            TextField(
              obscureText: true,
              onChanged: (value) {
                _password = value;
              },
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Password',
                icon: Icon(Icons.lock),
              ),
            ),
            FlatButton(
              onPressed: () async {
                try {
                  final user = await _auth.signInWithEmailAndPassword(
                      email: _email, password: _password);
                  if (user != null) {
                    Navigator.pushNamed(context, body1.id);
                  }
                } catch (e) {
                  print(e);
                }
              },
              child: Text('LOGIN'),
            )
          ],
        ),
      ),
    );
  }
}
