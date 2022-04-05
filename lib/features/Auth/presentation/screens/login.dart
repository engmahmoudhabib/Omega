import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_loalizations.dart';

import 'package:omega/core/statics/colors.dart';
import 'package:omega/features/Auth/presentation/widgets/input_textfiled.dart';

import '../widgets/animated_image.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController? userNameOrEmail;
  TextEditingController? password;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          resizeToAvoidBottomInset: true,

      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: const Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffE6E6E6),
              MyAppColors.iconColor,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            TweenAnimationBuilder(
              curve: Curves.bounceInOut,
              builder: (
                BuildContext context,
                double value,
                Widget? child,
              ) =>
                  AnimatedImage(
                height: value,
                width: value,
              ),
              tween: Tween<double>(
                begin: 140,
                end: 190,
              ),
              duration: const Duration(
                milliseconds: 2000,
              ),
              child: AnimatedImage(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            TweenAnimationBuilder(
              curve: Curves.decelerate,
              builder: (BuildContext context, double? value, Widget? child) =>
                  InputTextField(
                width: value,
                  textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                controller: userNameOrEmail,
                hintText: AppLocalizations.of(context)!.usernameoremail,
                isObscureText: false,
                prefixIcon: const Icon(Icons.email),
              ),
              duration: const Duration(
                milliseconds: 2000,
              ),
              tween: Tween<double>(
                begin: 0,
                end: MediaQuery.of(context).size.width,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            TweenAnimationBuilder(
              curve: Curves.decelerate,
              builder: (BuildContext context, double? value, Widget? child) =>
                  InputTextField(
                width: value,
                 keyboardType: TextInputType.text,
                 textInputAction: TextInputAction.done,
                controller: password,
                hintText: AppLocalizations.of(context)!.password,
                isObscureText: true,
                prefixIcon: const Icon(Icons.lock),
              ),
              duration: const Duration(
                milliseconds: 2000,
              ),
              tween: Tween<double>(
                begin: 0,
                end: MediaQuery.of(context).size.width,
              ),
            ),
             SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: FlatButton(
color: MyAppColors.iconColor,
                onPressed: () {},
                child: Text(
                  AppLocalizations.of(context)!.login,
                    style: TextStyle(color: Colors.white,),
                ),
              
              ),
            ),
          ],
        ),
      ),
    );
  }
}
