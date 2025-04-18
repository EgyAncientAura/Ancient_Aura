import 'package:flutter/material.dart';
import '../widgets/social_button.dart';
import '../widgets/primary_button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              const Icon(Icons.auto_graph, size: 48, color: Colors.orange),
              const SizedBox(height: 24),
              const Text(
                'Explore AncientAura',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              const Text(
                'Now your finances are in one place\nand always under control',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              const SocialButton(
                icon: Icons.g_mobiledata,
                text: 'Continue with Google',
              ),
              const SizedBox(height: 16),
              const SocialButton(
                icon: Icons.apple,
                text: 'Continue with Apple',
              ),
              const SizedBox(height: 16),
              const SocialButton(
                icon: Icons.mail,
                text: 'Continue with Email',
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: const Text.rich(
                  TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(color: Colors.white),
                    children: [
                      TextSpan(
                        text: "Log in",
                        style: TextStyle(color: Colors.orange),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
