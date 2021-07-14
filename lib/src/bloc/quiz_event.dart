part of 'quiz_bloc.dart';

abstract class QuizEvent extends Equatable {
  const QuizEvent();
  @override
  List<Object> get props => [];
}

class FetchQuestion extends QuizEvent {
  final questNumber;

  FetchQuestion(this.questNumber);
  @override
  List<Object> get props => [questNumber];
}

class CheckAns extends QuizEvent {
  final BuildContext context;
  final question;
  final int indexOption;
  CheckAns(this.context, this.question, this.indexOption);
  @override
  List<Object> get props => [question];
}

class QuizChangeQuestionPage extends QuizEvent {}
