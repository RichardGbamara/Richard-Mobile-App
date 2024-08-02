// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_service.dart' as auth_service;

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final auth_service.AuthService _authService =
      auth_service.AuthService(); // AuthService instance
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  void _register() async {
    if (_passwordController.text == _confirmPasswordController.text) {
      User? user = await _authService.registerWithEmailAndPassword(
          _emailController.text,
          _passwordController.text,
          _usernameController.text);
      if (user != null) {
        print('Registration successful');
        _clearFields();
        // Navigator.of(context).pushReplacementNamed('/login'); // Navigate to login
        Navigator.pushNamed(context, '/login');
      } else {
        print('Registration failed');
        _showErrorDialog('Registration failed. Please try again.');
      }
    } else {
      _showErrorDialog('Passwords do not match');
    }
  }

  void _clearFields() {
    _emailController.clear();
    _passwordController.clear();
    _usernameController.clear();
    _confirmPasswordController.clear();
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Create your account',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildTextField(_usernameController, 'Username', Icons.person),
            const SizedBox(height: 20),
            _buildTextField(_emailController, 'Email', Icons.email),
            const SizedBox(height: 20),
            _buildTextField(_passwordController, 'Password', Icons.lock,
                isPassword: true),
            const SizedBox(height: 20),
            _buildTextField(
                _confirmPasswordController, 'Confirm Password', Icons.lock,
                isPassword: true),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _register,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Register'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account? "),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed('/login'); // Navigate to login
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String label, IconData icon,
      {bool isPassword = false}) {
    return TextField(
      controller: controller,
      obscureText: isPassword
          ? (label == 'Password' ? _obscurePassword : _obscureConfirmPassword)
          : false,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon((label == 'Password'
                        ? _obscurePassword
                        : _obscureConfirmPassword)
                    ? Icons.visibility
                    : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    if (label == 'Password') {
                      _obscurePassword = !_obscurePassword;
                    } else {
                      _obscureConfirmPassword = !_obscureConfirmPassword;
                    }
                  });
                },
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
