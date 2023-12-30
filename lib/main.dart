import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:beat_box/Blocs/Auth/AuthBloc/autth_bloc.dart';
import 'package:beat_box/AuthScreen/authscreen.dart';

import 'package:beat_box/Splash/splashScreen.dart';
import 'package:beat_box/cubit/song_play_cubit.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseAppCheck.instance
      .activate(androidProvider: AndroidProvider.playIntegrity);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
          
        ),
        BlocProvider(
          create: (context) => SongPlayCubit(),
          
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BeatBox',
        theme: ThemeData(
          textTheme: const TextTheme(
            
              displayLarge: TextStyle(
                  fontFamily: 'MyUniqueFont',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
                  displayMedium: TextStyle(
                  fontFamily: 'MyUniqueFont',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)
                  ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: AnimatedSplashScreen(
            splash: const SplashScreen(),
            backgroundColor: const Color(0xff050A30),
            duration: 3000,
            splashIconSize: 500,
            splashTransition: SplashTransition.fadeTransition,
            nextScreen: AuthScreen()),
      ),
    );
  }
}
