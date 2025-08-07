import 'package:auth/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final supabase = Supabase.instance.client;

  Future<String?> signUp(String email,String name, String password) async {
    try {
      final response = await supabase.auth.signUp(
        password: password,
        email: email,
        data: {'name': name},
      );
      if (response.session != null && response.user != null) {
        return null; // Success
      }
      return "An error occured";
    } on AuthException catch (e) {
      return e.message;
    } catch (e) {
      return 'Error: $e';
    }
  }

  Future<String?> signIn(String email, String password) async {
    try {
      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response.session != null && response.user != null) {
        return null; // Success
      }
      return "An error occured";
    } on AuthException catch (e) {
      return e.message;
    } catch (e) {
      return 'Error: $e';
    }
  }

  Future<void> logout(BuildContext context) async {
    try {
      await supabase.auth.signOut();
      if (!context.mounted) return;
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (_) => LoginPage()));
    } catch (e) {
      print("Logout error $e");
    }
  }
}
