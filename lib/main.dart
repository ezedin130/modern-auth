import 'package:auth/pages/home_page.dart';
import 'package:auth/pages/login_page.dart';
import 'package:auth/service/gate.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: "//your url" , anonKey: "your anon key");
  runApp(
    const MyApp()
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: AuthGate(),);
  }
}
