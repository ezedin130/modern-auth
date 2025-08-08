import 'package:auth/components/MyTextField.dart';
import 'package:auth/components/MyTile.dart';
import 'package:auth/components/my_button.dart';
import 'package:auth/pages/login_page.dart';
import 'package:auth/service/auth_service.dart';
import 'package:flutter/material.dart';

import '../components/snack_bar.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();

  final nameController = TextEditingController();

  final passwordController = TextEditingController();

  final AuthService _authService = AuthService();

  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();

  void signUpUser() async {
    String email = emailController.text.trim();
    String name = nameController.text.trim();
    String password = passwordController.text.trim();
    setState(() {
      isLoading = true;
    });
    try {
      final result = await _authService.signUp(email, name, password);
      if (result == null) {
        showSnackBar(context, "Signup Successfull!");
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => LoginPage()));
      }
      else {
        showSnackBar(context, "Signup Failed!");
      }
    }
    catch(e){
      showSnackBar(context, 'An error occured : $e');
    }
  }
  void signInWithGoogle(){
    try{
      _authService.signInWithGoogle();
    }
    catch(e){
      showSnackBar(context, 'error : $e');
    }
  }
  void signInWithGithub(){
    try{
      _authService.signInWithGithub();
    }
    catch(e){
      showSnackBar(context, 'error : $e');
    }
  }
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              const Icon(Icons.lock, size: 100),

              const SizedBox(height: 50),

              Text(
                'Welcome to the registration page!',
                style: TextStyle(color: Colors.grey[700], fontSize: 16),
              ),

              const SizedBox(height: 25),

              MyTextField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Your Name';
                  }
                  return null;
                },
                controller: nameController,
                hintText: 'Full Name',
                obsecureText: false,
              ),

              const SizedBox(height: 15),

              MyTextField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  // Basic email pattern
                  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                  if (!emailRegex.hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                controller: emailController,
                hintText: 'Email',
                obsecureText: false,
              ),

              const SizedBox(height: 15),

              MyTextField(
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 6) {
                    return 'Please Enter Your Password , at least 6 characters';
                  }
                  return null;
                },
                controller: passwordController,
                hintText: "Password",
                obsecureText: true,
              ),

              const SizedBox(height: 10),

              MyButton(
                  onTap:(){
                    if(_formKey.currentState!.validate()){
                      signUpUser();
                    }
                  },
                text: 'Sign Up',
              ),


              const SizedBox(height: 50),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(thickness: 0.5, color: Colors.grey[400]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(thickness: 0.5, color: Colors.grey[400]),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 50),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Mytile(
                      imagePath: 'lib/assets/google.png',
                    onTap: (){
                      signInWithGoogle();
                    },
                  ),

                  const SizedBox(width: 25),

                  Mytile(
                      imagePath: 'lib/assets/github.png',
                    onTap: (){
                      signInWithGithub();
                    },
                  ),
                ],
              ),

              const SizedBox(height: 50),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text(
                      'Login here',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
