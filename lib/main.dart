import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sign_in/pages/home_screen.dart';
import 'package:sign_in/pages/signed_in.dart';
// Step 2

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

     final _router = GoRouter(            // GoRout function to transfer from home screen to signed in page after entering the username and password
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: '/signed_in',
        builder: (context, state) => SignedIn(username: state.extra as String, Password: '',
      )),
    ],
  );

  
  MyApp({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    // Step 4
    return MaterialApp.router(
   debugShowCheckedModeBanner: false,
   routerConfig: _router,
    
    );
 
  }
  

  // Step 3
}
