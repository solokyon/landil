import 'package:flutter/material.dart';
import 'package:landil/pages/homepage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://atkbtucvwpdsnchqklwh.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2J0dWN2d3Bkc25jaHFrbHdoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTEzNDQxMjUsImV4cCI6MjA2NjkyMDEyNX0.oD7RZfV2BaMjoghBfj06gRPCjgfm0g9hWgvaDlq2AuM',
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Homepage(),
    );
  }
} 
