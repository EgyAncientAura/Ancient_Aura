import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/password_text_field.dart';
import '../utils/validators.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Create account",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 25),

                // Full Name
                CustomTextField(
                  label: "Full Name",
                  hintText: "Your name",
                  controller: _fullNameController,
                  validator: (value) =>
                      value == null || value.isEmpty ? "Full Name is required" : null,
                ),

                const SizedBox(height: 15),

                // Username
                CustomTextField(
                  label: "Username",
                  hintText: "Your username",
                  controller: _usernameController,
                  validator: (value) =>
                      value == null || value.isEmpty ? "Username is required" : null,
                ),

                const SizedBox(height: 15),

                // Email
                CustomTextField(
                  label: "Email",
                  hintText: "Your email",
                  controller: _emailController,
                  validator: Validators.validateEmail,
                ),

                const SizedBox(height: 15),

                // Password
                PasswordTextField(
                  controller: _passwordController,
                  validator: Validators.validatePassword,
                ),

                const SizedBox(height: 15),

                // Confirm Password
                PasswordTextField(
                  controller: _confirmPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Confirm Password is required";
                    } 
                    if (value != _passwordController.text) {
                      return "Passwords do not match";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 10),

                // Terms Checkbox
                Row(
                  children: [
                    Checkbox(
                      value: _acceptTerms,
                      onChanged: (value) {
                        setState(() {
                          _acceptTerms = value ?? false;
                        });
                      },
                      activeColor: Colors.orange,
                    ),
                    const Expanded(
                      child: Text(
                        "I accept the terms and privacy policy",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // Submit Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (!_acceptTerms) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("You must accept the terms"),
                          ),
                        );
                        return;
                      }

                      // Proceed with account creation
                      print("Account created successfully!");
                    } 
                  },
                  child: const Text(
                    "Create Account",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 20),

                // Terms Text
                Center(
                  child: Text.rich(
                    TextSpan(
                      text: "By creating an account or signing you agree to our ",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                      children: [
                        TextSpan(
                          text: "Terms and Conditions",
                          style: TextStyle(
                            color: Colors.orange,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
