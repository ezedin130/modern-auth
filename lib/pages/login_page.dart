import 'package:auth/components/MyTextField.dart';
import 'package:auth/components/MyTile.dart';
import 'package:auth/components/my_button.dart';
import 'package:auth/components/snack_bar.dart';
import 'package:auth/pages/register_page.dart';
import 'package:auth/service/auth_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
   LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
   final emailController = TextEditingController();

   final passwordController = TextEditingController();

   final AuthService _authService = AuthService();

   bool isLoading = false;

   final _formKey = GlobalKey<FormState>();

   void signUserIn()async{
     String email = emailController.text.trim();
     String password = passwordController.text.trim();
     if(!email.contains(".com")){
       showSnackBar(context, "Invalid Email");
     }
     setState(() {
       isLoading = true;
     });

     final result = await _authService.signIn(email, password);
     if(result == null){
       setState(() {
         isLoading = false;
       });
       showSnackBar(context, "Signup Successfull!");
     }
     else{
       setState(() {
         isLoading = false;
       });
       showSnackBar(context, "Signup Failed!");
     }
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

              const SizedBox(height: 50,),

              Text('Welcome back you\'ve been missed!',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25,),

              MyTextField(
                validator: (value){
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                },
                controller: emailController,
                hintText: 'email',
                obsecureText: false,
              ),

              const SizedBox(height: 15),

              MyTextField(
                validator: (value){
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                },
                controller: passwordController,
                hintText: 'Password',
                obsecureText: true,
              ),

              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),

              MyButton(
                onTap: signUserIn,
                text: 'Sign In',
                ),

              const SizedBox(height: 50),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      )
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                      Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      )
                      ),
                  ]
                ),
              ),

                      const SizedBox(height: 50,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Mytile(imagePath: 'lib/assets/google.png',
                          ),
                          const SizedBox(width: 25,),
                          Mytile(imagePath: 'lib/assets/github.png',
                          ),
                        ],
                      ),

                      const SizedBox(height: 50,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Not a member?',
                            style: TextStyle(
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(width: 4,),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => RegisterPage())
                              );
                            },
                            child: const Text(
                              'Register now',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      )
                  ],
                ),
              ),
      ),
    //       ],
    //     ),
    //   ),
    // );
    );
  }
}
