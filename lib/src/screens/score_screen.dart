import 'package:appdemo/src/bloc/quiz_bloc.dart';
import 'package:appdemo/src/constants/constant_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class Score extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => QuizBloc(),
        child: Stack(fit: StackFit.expand, children: [
          SvgPicture.asset("assets/icons/bg.svg",
              fit: BoxFit.fill, height: double.infinity),
          Column(
            children: [
              Spacer(flex: 3),
              Text('Score',
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      ?.copyWith(color:ScoreSreen.shadowColor)),
              Spacer(),
              BlocBuilder<QuizBloc, QuizState>(
                builder: (context, state) {
                  return Text(
                    '${context.read<QuizBloc>().correctAnswer * 10}/${context.read<QuizBloc>().questions.length * 10}',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(color:ScoreSreen.shadowColor),
                  );
                },
              ),
              Spacer(flex: 3),
            ],
          )
        ]),
      ),
    );
  }
}
