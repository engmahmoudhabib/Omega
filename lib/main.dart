import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:omega/core/statics/assets_paths.dart';
import 'package:flutter_gen/gen_l10n/app_loalizations.dart';
import 'package:omega/features/Auth/presentation/screens/login.dart';
import 'package:omega/features/home/presentation/screens/home.dart';
import 'core/providers/local_provider.dart';
import 'features/Auth/presentation/screens/welcome.dart';
import 'l10n/l10n.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LocalProvider(),
      builder : (context , child) {
        final provider = Provider.of<LocalProvider>(context);
        return MaterialApp(
        title: 'OMEGA',
        supportedLocales: L10n.all,
        locale: provider.locale,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',  
 
        home: AnimatedSplashScreen(
          splash: Image.asset(
            AssetsPaths.appIcon,
          ),
          nextScreen: const WelcomeScreen(),
          backgroundColor: Colors.white,
          centered: true,
          splashIconSize: 200,
          splashTransition: SplashTransition.fadeTransition,
          animationDuration: const Duration(
            seconds: 2,
          ),
        ),
      );
      }
    );
  }
}
