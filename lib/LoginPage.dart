import 'package:flutter/material.dart';
import 'package:flutter1/models/user_model.dart';
import 'package:flutter1/pages/UserPage/view/UserPage.dart';
import 'package:provider/provider.dart';
import '../controllers/auth_service.dart';
import 'providers/user_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login() async {
    if (_formKey.currentState!.validate()) {
      final username = usernameController.text;
      final password = passwordController.text;
      print('Username: $username, Password: $password');

      try {
        final result = await AuthService().login(username, password);

        if (result['success']) {
          UserModel authResponse = result['message'];

          if (!mounted) return;
          Provider.of<UserProvider>(context, listen: false).onLogin(authResponse);

          print('Login successful. Welcome, ${authResponse.user.name}');
          print('Access Token: ${authResponse.accessToken}');
          print('Refresh Token: ${authResponse.refreshToken}');
          print('Role: ${authResponse.role}');

          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => UserPage()),
            (route) => false,
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Login failed. Please try again.')),
          );
        }
      } catch (err) {
        print(err);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Custom AppBar with new gradient (blue to light blue)
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF3A7BD5), // Start color (blue)
                  Color(0xFF00D2FF), // End color (light blue)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: AppBar(
              title: Text('Login Page'),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          ),
          // Add a SizedBox to reduce the space between the AppBar and the form
          SizedBox(height: 20), // Adjust this value to move the form up or down
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  color: Colors.white, // Keep the background white
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start, // Keep this for top alignment
                      children: [
                        // Username field with border
                        TextFormField(
                          controller: usernameController,
                          decoration: InputDecoration(
                            labelText: 'Username',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.blueAccent,
                                width: 2.0, // Width of the border
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.orange,
                                width: 2.0, // Border when focused
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your username';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        // Password field with border
                        TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.blueAccent,
                                width: 2.0, // Width of the border
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.orange,
                                width: 2.0, // Border when focused
                              ),
                            ),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _login,
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(120, 50), // Set new size for the button
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: const Color.fromARGB(255, 36, 116, 227), // Set button color to orange
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white, // Text color
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
