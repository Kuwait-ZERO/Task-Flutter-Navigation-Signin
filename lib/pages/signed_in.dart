import 'package:flutter/material.dart';

class SignedIn extends StatelessWidget {
  final String username ; //  created a variable to hold the username.
  final String Password ; //  created a variable to hold the Password.
   SignedIn({
    Key? key, required this.username, required this.Password,
  }) : super(key: key);
  // Step 6
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text("Sign in"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            // Step 9
            Text("Welcome $username"),  // username was taken as input and displayed after signed in
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 140,
            ),
          ],
        ),
      ),
    );
  }
}
