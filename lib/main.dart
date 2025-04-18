import 'package:ancient_aura/screens/create_account_screen.dart';
import 'package:ancient_aura/screens/sign_in_screen.dart';
import 'package:ancient_aura/screens/start_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AncientAura());
}

class AncientAura extends StatelessWidget {
  const AncientAura({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const CreateAccountScreen(),
    );
  }
}