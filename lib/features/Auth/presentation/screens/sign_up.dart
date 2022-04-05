import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_loalizations.dart';
import 'package:omega/core/statics/colors.dart';
import 'package:omega/features/Auth/presentation/widgets/animated_image.dart';
import 'package:omega/features/Auth/presentation/widgets/input_textfiled.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:omega/features/home/presentation/screens/home.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {
  TextEditingController userNameOrEmail = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController mobile = TextEditingController();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String? _errorMessage = 'An undefined Error happened';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
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
            TweenAnimationBuilder(
              curve: Curves.decelerate,
              builder: (BuildContext context, double? value, Widget? child) =>
                  InputTextField(
                width: value,
                textInputAction: TextInputAction.done,
                keyboardType: const TextInputType.numberWithOptions(
                    decimal: false, signed: false),
                controller: mobile,
                hintText: AppLocalizations.of(context)!.mobile,
                isObscureText: false,
                prefixIcon: const Icon(Icons.phone),
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
                onPressed: () async {
                  try {
                    UserCredential credential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: userNameOrEmail.text,
                      password: password.text,
                    );
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => Home()));
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'ERROR_INVALID_EMAIL') {
                      setState(() {
                        _errorMessage =
                            'Your email address appears to be malformed';
                      });
                    } else if (e.code == 'ERROR_WRONG_PASSWORD') {
                      setState(() {
                        _errorMessage = "Your password is wrong";
                      });
                    } else if (e.code == 'ERROR_USER_NOT_FOUND') {
                      setState(() {
                        _errorMessage = "User with this email doesn't exist";
                      });
                    } else if (e.code == 'ERROR_USER_DISABLED') {
                      setState(() {
                        _errorMessage =
                            "User with this email has been disabled";
                      });
                    } else if (e.code == 'ERROR_TOO_MANY_REQUESTS') {
                      setState(() {
                        _errorMessage = "Too many requests. Try again later";
                      });
                    } else if (e.code == 'ERROR_OPERATION_NOT_ALLOWED') {
                      setState(() {
                        _errorMessage =
                            "Signing in with Email and Password is not enabled";
                      });
                    }
                    showAnimatedDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return ClassicGeneralDialogWidget(
                          titleText: 'Error',
                          contentText: _errorMessage,
                          onPositiveClick: () {
                            Navigator.of(context).pop();
                          },
                          positiveText: 'OK',
                        );
                      },
                      animationType: DialogTransitionType.slideFromTop,
                      curve: Curves.fastOutSlowIn,
                      duration: const Duration(seconds: 1),
                    );
                  } catch (e) {
                    showAnimatedDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return ClassicGeneralDialogWidget(
                          titleText: 'Error',
                          contentText: e.toString(),
                          onPositiveClick: () {
                            Navigator.of(context).pop();
                          },
                          onNegativeClick: () {
                            Navigator.of(context).pop();
                          },
                        );
                      },
                      animationType: DialogTransitionType.slideFromTop,
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(seconds: 1),
                    );
                  }
                },
                child: Text(
                  AppLocalizations.of(context)!.register,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
