import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/quiz_bloc.dart';
import 'screens/welcome_screen.dart';

class MyApp extends StatelessWidget {
  final QuizBloc bloc = QuizBloc();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: BlocProvider(
        create: (context) => QuizBloc(),
        child: WelcomeScreen(),
      ),
    );
  }
}
