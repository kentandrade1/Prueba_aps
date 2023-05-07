import 'package:flutter/material.dart';
import 'package:prueba_categorias/homeScreens.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = '';
  String _password = '';
  String _errorMessage = '';

  // Add form validation and submission code here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(32),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              color: Colors.blue,
              elevation: 20,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 32),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                        errorText: _errorMessage.isNotEmpty ? _errorMessage : null,
                      ),
                      onChanged: (value) => _email = value.trim(),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Password',
                        errorText: _errorMessage.isNotEmpty ? _errorMessage : null,
                      ),
                      obscureText: true,
                      onChanged: (value) => _password = value.trim(),
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () {
                         Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  HomeScreen()),
                      );
                      },
                      child: const Text('Login'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
