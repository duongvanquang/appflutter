import 'package:flutter/material.dart';
import 'package:appdemo/src/bloc/quiz_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../bloc/quiz_event.dart';
import '../constants/constant_color.dart';
import '../screens/quiz_screen.dart';


class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String enterName = '';
    final playerName = BlocProvider.of<QuizBloc>(context);
    return Scaffold(body: BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        if (state is QuizInitial) {
          return Stack(
            children: [
              SvgPicture.asset('assets/icons/bg.svg',
                  fit: BoxFit.fill, height: double.infinity),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppColor.defaultPadding),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Spacer(flex: 2),
                        Text("Let's Play Quiz,",
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                ?.copyWith(
                                    color: WelcomeSreen.backgroundColor,
                                    fontWeight: FontWeight.bold)),
                        Text("Enter your informations below"),
                        Spacer(),
                        TextField(
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xFF1C2341),
                              hintText: "Full Name",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)))),
                          onChanged: (text) {
                            enterName = text;
                          },
                        ),
                        Spacer(),
                        TextButton(
                            onPressed: () {
                              if (enterName != "") {
                                playerName.add(FetchQuestion(enterName));
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(
                                  AppColor.defaultPadding * 0.75),
                              decoration: BoxDecoration(
                                  gradient: WelcomeSreen.backgroundGradien,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                              child: Text("Lets Start Quiz",
                                  style: Theme.of(context)
                                      .textTheme
                                      .button
                                      ?.copyWith(
                                          color: WelcomeSreen.titleTextColor)),
                            )),
                        Spacer(flex: 2)
                      ]),
                ),
              )
            ],
          );
        } else if (state is QuestionSuccess) {
          return QuizScreen(state.data);
        } else {
          return Text(
            "",
            style: Theme.of(context)
                .textTheme
                .headline1
                ?.copyWith(color: WelcomeSreen.backgroundColor),
          );
        }
      },
    ));
  }
}
