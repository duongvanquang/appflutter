import 'package:appdemo/src/bloc/quiz_bloc.dart';
import 'package:appdemo/src/constants/constants.dart';
import 'package:appdemo/src/screens/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String enterName = '';
    final playerName = BlocProvider.of<QuizBloc>(context);
    return Scaffold(
      body: BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        if (state is QuizInitial) {
          return Stack(
            children: [
              SvgPicture.asset('assets/icons/bg.svg',
                  fit: BoxFit.fill, height: double.infinity),
              SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Spacer(flex: 2),
                        Text("Let's Play Quiz,",
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                ?.copyWith(
                                    color: Colors.white,
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
                              padding: EdgeInsets.all(defaultPadding * 0.75),
                              decoration: BoxDecoration(
                                  gradient: kPrimaryGradient,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                              child: Text("Lets Start Quiz",
                                  style: Theme.of(context)
                                      .textTheme
                                      .button
                                      ?.copyWith(color: Colors.black)),
                            )),
                        Spacer(flex: 2)
                      ]),
                ),
              )
            ],
          );
        } else if (state is QuestionLoadProgress) {
          return Center(child: CircularProgressIndicator());
        } else if (state is QuestionSuccess) {
          return QuizScreen(state.data);
        } else {
          return Text(
            "Error",
            style: Theme.of(context)
                .textTheme
                .headline1
                ?.copyWith(color: Colors.white),
          );
        }
      },
    ));
  }
}
