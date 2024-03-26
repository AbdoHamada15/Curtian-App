import 'package:curtian_app/firebase_options.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:curtian_app/page_gallery/constants/constants.dart';
import 'package:curtian_app/page_admin/forms/user_auth/auth.dart';
import 'package:curtian_app/page_admin/forms/fotgot_pass.dart';
import 'package:curtian_app/page_admin/admin_main.dart';
import 'package:curtian_app/page_admin/forms/login.dart';
import 'package:curtian_app/page_admin/pages/signup/sign_up.dart';
import 'package:curtian_app/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:curtian_app/page_gallery/gallery_screen.dart';
import 'package:avatar_glow/avatar_glow.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // Arabic RTL
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale("ar", "AE")],
        locale: const Locale("ar", "AE"),
        title: 'Paris App ',
        /*
        theme: lightModeTheme,
        darkTheme: darkModeTheme,
        */
        debugShowCheckedModeBanner: false,
        scrollBehavior: const CupertinoScrollBehavior(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: kprimaryColor),
          useMaterial3: true,
          fontFamily: "Avenir",
          textTheme: const TextTheme(
            titleSmall: TextStyle(
              fontFamily: "Avenir",
              color: kprimaryTextColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        //home: const SplashScreen(),
        routes: {
          '/': (context) => const SplashScreen(),
          'auth': (context) => const Auth(),
          'adminmain': (context) => const AdminScreen(),
          'forgotScreen': (context) => const ForgotPasswordPage(),
          'signupScreen': (context) => const SignupScreen(),
          'loginScreen': (context) => const LoginScreen(),
          'gallery': (context) => const GalleryScreen(),
          'mainscreen': (context) => const MainScreen(),
          'homeadmin': (context) => const AdminScreen(),
        });
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: AvatarGlow(
        startDelay: const Duration(milliseconds: 250),
        glowColor: kGlowColor,
        glowShape: BoxShape.circle,
        curve: Curves.fastOutSlowIn,
        child: Material(
          elevation: 6.0,
          shape: const CircleBorder(),
          child: CircleAvatar(
            backgroundColor: kwhiteColor,
            radius: 200.0,
            child: Image.asset(
              'assets/img/background/paris_2.png',
              height: 250,
            ),
          ),
        ),
      ),
      duration: 2000,
      nextScreen: const MainScreen(),
      splashIconSize: 350,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
