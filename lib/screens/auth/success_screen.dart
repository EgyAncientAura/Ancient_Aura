import 'package:flutter/material.dart';
import '../../widgets/primary_button.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 2),

              // ✅ Success Icon or Animation (optional)
              const Icon(
                Icons.check_circle_rounded,
                color: Colors.orange,
                size: 100,
              ),

              const SizedBox(height: 40),

              // 🎉 Success message
              const Text(
                "Congratulations!",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "your Account is created successfully",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Now you can log in",
                style: TextStyle(color: Colors.grey),
              ),

              const Spacer(flex: 3),

              // 🔙 Back to sign-in
              PrimaryButton(
                text: "Back to Sign In page",
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
