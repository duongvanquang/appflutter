import 'package:appdemo/src/bloc/quiz_bloc.dart';
import 'package:appdemo/src/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'progressbar.dart';
import 'question.dart';

class Body extends StatelessWidget {
  final datas;
  Body(this.datas);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset("assets/icons/bg.svg",
            fit: BoxFit.fill, height: double.infinity),
        SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: ProgessBarTimer(),
            ),
            SizedBox(height: defaultPadding),
            BlocBuilder<QuizBloc, QuizState>(
              builder: (context, state) {
                return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Text.rich(TextSpan(
                        text:
                            'Question ${context.read<QuizBloc>().questionNumber}',
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            ?.copyWith(color: kSecondaryColor),
                        children: [
                          TextSpan(
                            text:
                                "/${context.read<QuizBloc>().questions.length}",
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                ?.copyWith(color: kSecondaryColor),
                          ),
                        ])));
              },
            ),
            Divider(thickness: 1.5),
            SizedBox(height: defaultPadding),
            Expanded(
              child: PageView.builder(
                physics: NeverScrollableScrollPhysics(),
                controller: context.read<QuizBloc>().pageController,
                onPageChanged: (value) =>
                    context.read<QuizBloc>().add(QuizChangeQuestionPage()),
                itemCount: context.read<QuizBloc>().questions.length,
                itemBuilder: (context, index) => QuestionCard(
                    data: context.read<QuizBloc>().questions[index]),
              ),
            )
          ],
        ))
      ],
    );
  }
}
