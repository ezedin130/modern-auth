import 'package:auth/service/auth_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 50),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(
              width: 400,
              height: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                //borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  'You are Logged In ',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.6,
                    decoration: TextDecoration.none
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 50),

          GestureDetector(
            onTap: (){
              _authService.logout(context);
            },
              child: Icon(
                  Icons.logout,
                  size: 100,
                  color: Colors.redAccent
              ),
          ),
        ],
      ),
    );
  }
}
