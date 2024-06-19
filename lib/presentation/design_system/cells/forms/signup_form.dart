import 'package:dupla/presentation/design_system/molecules/inputs/auth_textfield.dart';
import 'package:dupla/presentation/design_system/tokens/colors.dart';
import 'package:dupla/presentation/design_system/tokens/fonts.dart';
import 'package:dupla/presentation/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpForm extends ConsumerStatefulWidget {
  const SignUpForm(
      {super.key,
      required this.nameController,
      required this.emailController,
      required this.passwordController});
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpFormState();
}

class _SignUpFormState extends ConsumerState<SignUpForm> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AuthTextfield(
            labelText: "Name",
            hintText: "Ej: Pedro",
            controller: widget.nameController,
            validator: Validators.validateUsername,
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            "(You won’t be able to change it after)",
            style: CustomFont.body01(CustomColors.primary2),
          ),
          const SizedBox(
            height: 15,
          ),
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
          const SizedBox(
            height: 5,
          ),
          CheckboxListTile(
            title: const Text(
              "I certify that I am at least 18 years old and that I agree to the Terms and Policies and Privacy Policy.",
              style: CustomFont.body01(CustomColors.primary2),
            ),
            value: _isChecked,
            side: const BorderSide(color: CustomColors.primary4, width: 2),
            activeColor: CustomColors.primary4,
            onChanged: (bool? value) {
              setState(() {
                _isChecked = value!;
              });
            },
            controlAffinity: ListTileControlAffinity
                .leading, //  places the checkbox at the start
          ),
        ],
      ),
    );
  }
}
