import 'package:dupla/presentation/design_system/tokens/colors.dart';
import 'package:dupla/presentation/design_system/tokens/fonts.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton(
      {super.key,
      required this.isTransparent,
      required this.isDisabled,
      required this.text,
      required this.onPressedFunction});
  final bool isTransparent;
  final bool isDisabled;
  final String text;
  final void Function() onPressedFunction;

  @override
  Widget build(BuildContext context) {
    Color textColor = isDisabled
        ? CustomColors.neutral75
        : isTransparent
            ? CustomColors.primary5
            : CustomColors.neutral10;
    Color buttonColor = isDisabled
        ? CustomColors.neutral50
        : isTransparent
            ? CustomColors.transparent
            : CustomColors.primary5;
    return FilledButton(
        onPressed: isDisabled ? null : onPressedFunction,
        style: ButtonStyle(
          shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
          backgroundColor: WidgetStatePropertyAll(buttonColor),
          padding: const WidgetStatePropertyAll<EdgeInsets>(
              EdgeInsets.fromLTRB(8, 12, 8, 12)),
          minimumSize: const WidgetStatePropertyAll(Size.fromHeight(44)),
          overlayColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return isTransparent
                    ? CustomColors.neutral25
                    : CustomColors.primary0;
              }
              return null;
            },
          ),
        ),
        child: Text(
          text,
          style: CustomFont.button(textColor),
        ));
  }
}