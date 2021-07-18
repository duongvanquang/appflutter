import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

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

class QuizChooseOption extends QuizEvent {
  final BuildContext context;
  final question;
  final int indexOption;
  QuizChooseOption(this.context, this.question, this.indexOption);
  @override
  List<Object> get props => [question];
}

class QuizChangeQuestionPageSuccess extends QuizEvent {}
