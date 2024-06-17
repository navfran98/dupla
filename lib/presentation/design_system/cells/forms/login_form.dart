import 'package:dupla/presentation/design_system/molecules/inputs/auth_textfield.dart';
import 'package:dupla/presentation/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key, required this.emailController, required this.passwordController});
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AuthTextfield(
            labelText: "Email",
            hintText: "Ej: pedro@pedro.com",
            controller: widget.emailController,
            validator: Validators.validateUsername,
          ),
          const SizedBox(
            height: 24,
          ),
          AuthTextfield(
            labelText: "Password",
            hintText: "Ej: pass12345",
            obscureText: true,
            controller: widget.passwordController,
            validator: Validators.validatePassword,
          ),
        ],
      ),
    );
  }
}