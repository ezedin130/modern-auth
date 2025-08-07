import 'package:auth/components/MyTextField.dart';
import 'package:auth/components/MyTile.dart';
import 'package:auth/components/my_button.dart';
import 'package:auth/pages/login_page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final usernameController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  void signUpUser() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
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
              controller: nameController,
              hintText: 'Full Name',
              obsecureText: false,
            ),

            const SizedBox(height: 15),

            MyTextField(
              controller: usernameController,
              hintText: 'Username',
              obsecureText: false,
            ),

            const SizedBox(height: 15),

            MyTextField(
              controller: passwordController,
              hintText: "Password",
              obsecureText: true,
            ),

            const SizedBox(height: 10),

            MyButton(onTap: signUpUser, text: 'Sign Up'),

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
                Mytile(imagePath: 'lib/assets/google.png'),

                const SizedBox(width: 25),

                Mytile(imagePath: 'lib/assets/github.png'),
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
    );
  }
}
