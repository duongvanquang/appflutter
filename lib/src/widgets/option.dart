import 'package:appdemo/src/bloc/quiz_bloc.dart';
import 'package:appdemo/src/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Option extends StatelessWidget {
  final datas;
  final index;
  final text;
  const Option(
      {Key? key, this.datas, this.text, this.index, required this.onPress})
      : super(key: key);
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: BlocBuilder<QuizBloc, QuizState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(top: defaultPadding),
            padding: EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              border: Border.all(
                    color: getColor(context.read<QuizBloc>(), index)),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${index + 1}. $text",
                      style: TextStyle(
                           color: getColor(context.read<QuizBloc>(), index),
                          fontSize: 16)),
                  Container(
                    width: 26,
                    height: 26,
                    decoration: BoxDecoration(
                        color: getColor(context.read<QuizBloc>(), index) ==
                               kGrayColor
                            ? Colors.transparent
                            : getColor(context.read<QuizBloc>(), index),
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                            color: getColor(context.read<QuizBloc>(), index))),
                    child:
                        getColor(context.read<QuizBloc>(), index) == kGrayColor
                            ? null
                            : Icon(getIcon(context.read<QuizBloc>(), index),
                                color: Colors.white, size: 16),
                  )
                ]),
          );
        },
      ),
    );
  }

  Color getColor(QuizBloc option, int index) {
    if (option.isAnswer) {
      if (option.idRightAnswer == index) {
        return kGreenColor;
      } else if (option.idAnswerSelected == index) {
        return kRedColor;
      }
    }
    return kGrayColor;
  }

  IconData getIcon(QuizBloc option, int index) {
    return getColor(option, index) == kGreenColor ? Icons.done : Icons.close;
  }
}
