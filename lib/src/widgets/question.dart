import 'package:appdemo/src/bloc/quiz_bloc.dart';
import 'package:appdemo/src/constants/constant_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'option.dart';

class QuestionCard extends StatelessWidget {
  final data;
  const QuestionCard({
    this.data,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppColor.defaultPadding),
      padding: EdgeInsets.all(AppColor.defaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            data.question,
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(color:QuizSreen.titleTextColor),
          ),
          SizedBox(height:AppColor.defaultPadding),
          BlocProvider(
            create: (context) => QuizBloc(),
            child: Column(
              children: [
                ...List.generate(
                    data.options.length,
                    (index) => Option(
                        index: index,
                        text: data.options[index],
                        onPress: () => {
                              context
                                  .read<QuizBloc>()
                                  .add(CheckAns(context, data, index))
                            })),
              ],
            ),
          )
        ],
      ),
    );
  }
}
