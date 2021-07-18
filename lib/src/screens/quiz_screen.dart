import 'package:flutter/material.dart';
import 'package:appdemo/src/bloc/quiz_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants/constant_color.dart';
import '../widgets/body.dart';


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
          BlocBuilder<QuizBloc, QuizState>(
            builder: (context, state) {
              return Row(
                children: [
                  TextButton(
                      onPressed: () =>
                          context.read<QuizBloc>().nextQuestion(context),
                      child: Text("Skip",
                          style: TextStyle(
                              color: QuizSreen.backgroundColor, fontSize: 16))),
                ],
              );
            },
          )
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop('/'),
        ),
      ),
      body: Body(data),
    );
  }
}
