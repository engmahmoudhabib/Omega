import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:omega/core/providers/local_provider.dart';
import 'package:omega/core/statics/assets_paths.dart';
import 'package:omega/core/statics/colors.dart';
import 'package:flutter_gen/gen_l10n/app_loalizations.dart';
import 'package:omega/features/home/presentation/screens/home.dart';
import 'package:provider/provider.dart';
import 'package:omega/core/auth/auth.dart';
import 'login.dart';
import 'sign_up.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final AuthService _auth = AuthService();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    firebaseAuth.authStateChanges().listen((User? user) {
      if (user != null) {
       /* Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) =>  Home())); */
      } else {
         
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                AssetsPaths.appIconWithNoBg,
                height: 190,
                width: 190,
              ),
              const SizedBox(
                height: 80,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LogIn(),
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
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
                  child: Text(
                    AppLocalizations.of(context)!.login,
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  /* final result = await _auth.signInAnon();
                  result == null ? print('null') : print('success');
                  print(result); */
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUp()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.register,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
             /*  InkWell(
                  onTap: () {
                    Provider.of<LocalProvider>(context, listen: false)
                        .setLocale(Locale('ar'));
                  },
                  child: Text('change language')) */
            ],
          ),
        ),
      ),
    );
  }
}
