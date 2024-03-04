import 'package:flutter/material.dart';
import 'package:pggather_app/main.dart';
import 'package:pggather_app/screen/signin_screen.dart';
import 'package:provider/provider.dart';
import 'package:pggather_app/provider/auth_provider.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login(BuildContext context) async {
    // Simple validation for demonstration purposes
    String token = await context
        .read<AuthProvider>()
        .login(_emailController.text, _passwordController.text);
    print(token);
    print("success");
    if (token == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid email or password')),
      );
    } else {
      // Navigate to the home screen when login is successful
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MainFeed()),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login Successful!')),
      );
    }
  }

  // Named constructor with named parameter
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'email'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => _login(context),
              child: Text('Login'),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInScreen()),
                  );
                },
                child: Text("create account"))
          ],
        ),
      ),
    );
  }
}
