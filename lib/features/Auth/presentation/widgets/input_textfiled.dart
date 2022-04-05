import 'package:flutter/material.dart';

class InputTextField extends StatefulWidget {
  final String? hintText;
  final double? width;
  final bool isObscureText;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
   TextEditingController? controller;
 final TextInputAction? textInputAction;
  InputTextField({
    Key? key,
    required this.width,
    required this.hintText,
    required this.isObscureText,
    required this.prefixIcon,
    required this.controller,
    required this.keyboardType,
    required this.textInputAction,
  }) : super(key: key);

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  @override
  void initState() {
    widget.controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: 50,
      padding: const EdgeInsets.symmetric(vertical: 13),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: const Color(0xffE6E6E6).withAlpha(100),
                offset: const Offset(2, 4),
                blurRadius: 8,
                spreadRadius: 2)
          ],
          color: Colors.white),
      child: TextFormField(
        obscureText: widget.isObscureText,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.hintText,
            prefixIcon: widget.prefixIcon,
            contentPadding: const EdgeInsets.only(
              left: 15,
              bottom: 12,
            ),
            hintStyle: const TextStyle(
              fontSize: 15,
            )),
      ),
    );
  }
}
