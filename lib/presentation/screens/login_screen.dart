import 'package:dupla/presentation/design_system/cells/forms/login_form.dart';
import 'package:dupla/presentation/design_system/molecules/buttons/auth_button.dart';
import 'package:dupla/presentation/design_system/tokens/colors.dart';
import 'package:dupla/presentation/design_system/tokens/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginScreen extends StatefulHookConsumerWidget {
  static const route = "/login";
  static const routeName = "login";

  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  void _handleLogin(String email, String password) async {
    setState(() {
      isLoading = true;
    });
    return;
  }

  @override
  Widget build(BuildContext context) {
    final usernameController = useTextEditingController();
    final passController = useTextEditingController();
    final bool isEmailEmpty = useListenableSelector(
        usernameController, () => usernameController.text.isEmpty);
    final bool isPassEmpty = useListenableSelector(
      passController, () => passController.text.isEmpty);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: CustomColors.primary0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text('Welcome Back!', style: CustomFont.welcomeTitle(CustomColors.primary2), softWrap: true,),
            const SizedBox(height: 10),
            Form(
                  key: _formKey,
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 36, vertical: 40),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            LoginForm(
                                emailController: usernameController,
                                passwordController: passController),
                            const SizedBox(
                              height: 80,
                            ),
                            isLoading
                                ? const CircularProgressIndicator(
                                    color: CustomColors.primary3,
                                  )
                                : AuthButton(
                                    isTransparent: false,
                                    isDisabled: (isEmailEmpty || isPassEmpty),
                                    text: "Log in",
                                    onPressedFunction: () {
                                      if (_formKey.currentState!.validate()) {
                                        _handleLogin(usernameController.text,
                                            passController.text);
                                      }
                                    }),
                          ])))
          ],
        ),
      )
    );
  }


}