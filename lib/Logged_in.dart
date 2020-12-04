import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class body1 extends StatefulWidget {
  static String id = 'loggedin';
  @override
  _body1 createState() => _body1();
}

class _body1 extends State<body1> {
  User loggedInUser;
  final _auth = FirebaseAuth.instance;

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Text('You have logged in successfully'),
            ),
          ),
          Expanded(
            child: FlatButton(
              child: Text('Log Out'),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
