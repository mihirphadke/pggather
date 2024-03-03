import 'package:flutter/material.dart';
import 'package:pggather_app/main.dart';
import 'package:pggather_app/provider/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:pggather_app/screen/login_screen.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }
    Future<bool> _checkToken() async {
    bool isLoggedIn = await context.read<AuthProvider>().isLoggedIn();
    if (!mounted) return false;

    return isLoggedIn;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _checkToken(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show splash screen while waiting for _checkToken to complete
          return Scaffold(
            body: Center(
              child: Text('splash',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
          );
        } else {
          // Once the future is complete, navigate based on the login status
          if (snapshot.data == true) {
            // User is logged in, navigate to the main app screen
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (context) =>
                        MainFeed()), // Assuming MainScreen is your app's main screen
              );
            });
          } else {
            // User is not logged in, navigate to the login screen
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (context) =>
                        LoginScreen()), // Assuming LoginScreen is your login screen
              );
            });
          }
          // Return a placeholder widget until navigation completes
          return Container();
        }
      },
    );
  }
}





