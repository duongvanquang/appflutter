import 'package:flutter/material.dart';
import 'package:appdemo/src/bloc/quiz_bloc.dart';
import 'package:appdemo/src/constants/constant_color.dart';
import 'package:appdemo/src/screens/score_screen.dart';
import 'package:appdemo/src/widgets/body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizScreen extends StatelessWidget {
  final data;
  QuizScreen(this.data);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Score()));
              },
              child: Text("Skip",
                  style: TextStyle(
                      color: QuizSreen.backgroundColor, fontSize: 16)))
        ],
      ),
      body: BlocBuilder<QuizBloc, QuizState>(
        builder: (context, state) {
          return Body(data);
        },
      ),
    );
  }
}
