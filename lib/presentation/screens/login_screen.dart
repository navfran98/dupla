import 'package:dupla/presentation/design_system/cells/forms/login_form.dart';
import 'package:dupla/presentation/design_system/molecules/buttons/auth_button.dart';
import 'package:dupla/presentation/design_system/tokens/colors.dart';
import 'package:dupla/presentation/design_system/tokens/fonts.dart';
import 'package:dupla/presentation/screens/welcome_screen.dart';
import 'package:dupla/router.dart';
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
    final emailController = useTextEditingController();
    final passController = useTextEditingController();
    final bool isEmailEmpty = useListenableSelector(
        emailController, () => emailController.text.isEmpty);
    final bool isPassEmpty = useListenableSelector(
        passController, () => passController.text.isEmpty);
    return Scaffold(
        appBar:
            AppBar(backgroundColor: CustomColors.primary0, actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.close_rounded,
              size: 35,
              color: CustomColors.primary4,
            ),
            hoverColor: CustomColors.primary1,
            onPressed: () {
              ref
                  .read(mainBeamerDelegateProvider)
                  .beamToNamed(WelcomeScreen.route);
            },
          ),
        ]),
        body: Container(
          color: CustomColors.primary0,
          padding: const EdgeInsets.fromLTRB(40, 60, 40, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Welcome Back!',
                style: CustomFont.welcomeTitle(CustomColors.primary5),
                softWrap: true,
              ),
              const SizedBox(height: 10),
              Form(
                  key: _formKey,
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            LoginForm(
                                emailController: emailController,
                                passwordController: passController),
                            const SizedBox(
                              height: 100,
                            ),
                            isLoading
                                ? const CircularProgressIndicator(
                                    color: CustomColors.primary5,
                                  )
                                : AuthButton(
                                    isTransparent: false,
                                    isDisabled: (isEmailEmpty || isPassEmpty),
                                    text: "Log in",
                                    onPressedFunction: () {
                                      if (_formKey.currentState!.validate()) {
                                        _handleLogin(emailController.text,
                                            passController.text);
                                      }
                                    }),
                          ])))
            ],
          ),
        ));
  }
}
