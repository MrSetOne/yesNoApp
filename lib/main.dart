import 'package:flutter/material.dart';
import 'package:yes_no/config/theme/app_theme.dart';
import 'package:yes_no/presentation/screens/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yes No App',
      theme: AppTheme(selectedColor: 1).theme(),
      debugShowCheckedModeBanner: false,
      home: const ChatScreen(),
    );
  }
}
