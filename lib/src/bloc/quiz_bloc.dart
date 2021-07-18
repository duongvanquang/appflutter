import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../model/quiz_model.dart';

import './quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(QuizInitial());
  bool _isAnswer = false;
  int _correctAnswer = 0;
  int _questionNumber = 1;
  int _idAnswerSelected = 0;
  int _idRightAnswer = 0;
  List<Question> _question = sample_data
      .map(
        (question) => Question(
            id: question['id'],
            question: question['question'],
            options: question['options'],
            answer: question['answer_index']),
      )
      .toList();
  PageController _pageController = PageController();
  bool get isAnswer => this._isAnswer;
  int get correctAnswer => this._correctAnswer;
  int get questionNumber => this._questionNumber;
  int get idAnswerSelected => this._idAnswerSelected;
  int get idRightAnswer => this._idRightAnswer;
  List<Question> get questions => this._question;
  PageController get pageController => this._pageController;
  @override
  Stream<QuizState> mapEventToState(
    QuizEvent event,
  ) async* {
    if (event is FetchQuestion) {
      yield QuestionLoadProgress();
      try {
        yield QuestionSuccess(data: _question);
      } catch (exception) {
        yield QuestionLoadProgress();
      }
    } else if (event is QuizChooseOption) {
      _idAnswerSelected = event.indexOption;
      _idRightAnswer = event.question.answer;
      _isAnswer = true;
      if (_idAnswerSelected == _idRightAnswer) {
        _correctAnswer++;
        yield QuizChooseRightAnswerSuccess();
      }
      Future.delayed(Duration(seconds: 1), () {
        nextQuestion(event.context);
      });
    }
     else if (event is QuizChangeQuestionPageSuccess) {
      _questionNumber++;
      yield QuizQuestionPageChangedSuccess();
    }
    yield QuestionSuccess(data: _question);
  }

  void nextQuestion(context) {
    if (_questionNumber != _question.length) {
      _isAnswer = false;
      pageController.nextPage(
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    } else {
      Navigator.of(context).pushNamed('/Score');
    }
  }

  void dispose() {
    _pageController.dispose();
  }
}
