import 'package:auth/pages/home_page.dart';
import 'package:auth/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: "https://eohgiketzdbhwzthghjk.supabase.co" , anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVvaGdpa2V0emRiaHd6dGhnaGprIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTQ1NDM4MTcsImV4cCI6MjA3MDExOTgxN30.8URKakLJbAMDHLqhR_meGgrII3QrgLIEp-whfT8Uk4A");
  runApp(
    const MyApp()
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage(),);
  }
}
