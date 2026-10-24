import 'package:flutter/material.dart';
import 'screens/main_shell.dart';

void main() => runApp(const KopiNusaApp());

class KopiNusaApp extends StatelessWidget {
  const KopiNusaApp({super.key});

  @override
  Widget build(BuildContext context) {
    const brown = Color(0xFF4E342E);
    return MaterialApp(
      title: 'KopiNusa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: brown),
        scaffoldBackgroundColor: const Color(0xFFFFF3E0),
        appBarTheme: const AppBarTheme(
          backgroundColor: brown,
          foregroundColor: Colors.white,
        ),
      ),
      home: const MainShell(),
    );
  }
}