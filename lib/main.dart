import 'package:flash/ui/screens/login_screen.dart';
import 'package:flash/ui/screens/user_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Quran());
}

class Quran extends StatefulWidget {
  const Quran({Key? key}) : super(key: key);

  @override
  State<Quran> createState() => _QuranState();
}

class _QuranState extends State<Quran> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: UserScreen.id,
      routes: {
        UserScreen.id: (context) => const UserScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
      },
    );
  }
}

// class Quran extends StatefulWidget {
//   const Quran({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       initialRoute: Jozz.id,
//     );
//   }
