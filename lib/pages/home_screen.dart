import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final ValueNotifier<bool> isUsernameEmpty = ValueNotifier<bool>(false); // To track username validation state
  final ValueNotifier<bool> isPasswordEmpty = ValueNotifier<bool>(false); // To track password validation state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign in"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Column(
        children: [
          // Username TextField
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ValueListenableBuilder<bool>(
              valueListenable: isUsernameEmpty,
              builder: (context, isEmpty, child) {
                return TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    hintText: "Username",
                    prefixIcon: const Icon(
                      Icons.account_circle,
                      color: Colors.deepPurpleAccent,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(
                        color: isEmpty ? Colors.red : Colors.deepPurpleAccent, // Highlight in red if empty
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Password TextField
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ValueListenableBuilder<bool>(
              valueListenable: isPasswordEmpty,
              builder: (context, isEmpty, child) {
                return TextField(
                  controller: passwordController,
                  obscureText: true, // To secure the password
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: const Icon(
                      Icons.key,
                      color: Colors.deepPurpleAccent,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(
                        color: isEmpty ? Colors.red : Colors.deepPurpleAccent, // Highlight in red if empty
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Login Button
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.deepPurpleAccent),
            ),
            onPressed: () {
              // Validate username and password
              bool isUsernameValid = usernameController.text.isNotEmpty;
              bool isPasswordValid = passwordController.text == "12345";

              // Update validation states
              isUsernameEmpty.value = !isUsernameValid;
              isPasswordEmpty.value = !isPasswordValid;

              // If both are valid, navigate to signed in page
              if (isUsernameValid && isPasswordValid) {
                GoRouter.of(context).go('/signed_in', extra: usernameController.text);
              } else {
                // Show error SnackBar if validation fails
                showErrorSnackBar(context, 'Invalid username or password');
              }
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white), // White Login text
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void showErrorSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: Colors.red, // Error color
    ),
  );
}
