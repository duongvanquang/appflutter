part of 'quiz_bloc.dart';

@immutable
abstract class QuizState extends Equatable {

  const QuizState();

  @override
  List<Object> get props => [];
}

class QuizInitial extends QuizState {}

class QuestionLoadProgress extends QuizState {}

class QuestionSuccess extends QuizState {
  final List<Question> data;
  QuestionSuccess({required this.data});
//  Question get getQuestion => data;
  @override
  List<Object> get props => [data];
}
class QuizQuestionPageChangedSuccess extends QuizState {}

class QuizChooseRightAnswerSuccess extends QuizState{}
