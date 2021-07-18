import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/quiz_bloc.dart';
import 'screens/welcome_screen.dart';
import '../src/screens/quiz_screen.dart';
import '../src/screens/score_screen.dart';

class MyApp extends StatelessWidget {
  final QuizBloc bloc = QuizBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizBloc(),
      child: MaterialApp(
          title: 'Quiz App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
          routes: {
            '/': (context) => WelcomeScreen(),
            '/Quiz': (context) => QuizScreen(bloc),
            '/Score': (context) => Score()
          }),
    );
  }
}
