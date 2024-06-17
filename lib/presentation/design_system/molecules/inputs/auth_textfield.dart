import 'package:dupla/presentation/design_system/tokens/colors.dart';
import 'package:dupla/presentation/design_system/tokens/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthTextfield extends ConsumerStatefulWidget {
  const AuthTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.validator,
    this.obscureText,
  });

  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final String? Function(String?)? validator;
  final bool? obscureText;

  @override
  ConsumerState<AuthTextfield> createState() => _AuthTextfieldState();
}

class _AuthTextfieldState extends ConsumerState<AuthTextfield> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  late bool _obscureText;
  bool _isError = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText == true ? true : false;
    _focusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    if (_focusNode.hasFocus) {
      setState(() {
        _isFocused = true;
      });
    } else {
      setState(() {
        _isFocused = false;
      });
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void clearText() {
    setState(() {
      widget.controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: const CustomFont.subtitle01(CustomColors.primary1),
        controller: widget.controller,
        focusNode: _focusNode,
        obscureText: _obscureText,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          hintText: widget.hintText,
          hintStyle: const CustomFont.subtitle01(CustomColors.primary2),
          errorStyle: const CustomFont.body02(CustomColors.error100),
          suffixIcon: (() {
            if (_isError) {
              return const Icon(Icons.error_rounded,
                  color: CustomColors.error100);
            }
            if (widget.obscureText != null) {
              return InkWell(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText == true
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: CustomColors.neutral25,
                ),
              );
            }
            if (_isFocused) {
              return InkWell(
                onTap: clearText,
                child: const Icon(Icons.close, color: CustomColors.primary2),
              );
            }
            return null;
          }()),
          contentPadding: const EdgeInsets.only(left: 16),
          labelText: widget.labelText,
          labelStyle: TextStyle(
            color: _isFocused && _isError
                ? CustomColors.error100
                : _isFocused
                    ? CustomColors.primary3
                    : CustomColors.primary1,
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
              color: CustomColors.neutral75,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2,
              color: CustomColors.primary3,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2,
              color: CustomColors.error100,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onTapOutside: (e) {
          _focusNode.unfocus();
        },
        onEditingComplete: () {
          _focusNode.unfocus();
        },
        onFieldSubmitted: (value) {
          _focusNode.unfocus();
        });
  }
}
