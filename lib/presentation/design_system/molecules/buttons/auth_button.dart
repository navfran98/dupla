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
        ? CustomColors.neutral10
        : isTransparent
            ? CustomColors.primary5
            : CustomColors.neutral10;
    Color buttonColor = isDisabled
        ? CustomColors.primary2
        : isTransparent
            ? CustomColors.transparent
            : CustomColors.primary5;
    Color borderColor = isDisabled
        ? CustomColors.primary2
        : isTransparent
            ? CustomColors.primary5
            : CustomColors.transparent;
    return FilledButton(
        onPressed: isDisabled ? null : onPressedFunction,
        style: ButtonStyle(
          shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: borderColor, width: 2))),
          backgroundColor: WidgetStatePropertyAll(buttonColor),
          padding: const WidgetStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(vertical: 12)),
          minimumSize: const WidgetStatePropertyAll(Size.fromHeight(50)),
          overlayColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return isTransparent
                    ? CustomColors.primary5.withOpacity(0.2)
                    : CustomColors.primary6.withOpacity(0.3);
              }
              if (states.contains(WidgetState.hovered)) {
                return isTransparent
                    ? CustomColors.primary1
                    : CustomColors.primary6.withOpacity(0.2);
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
