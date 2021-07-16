import 'dart:async';
 
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/percent_indicator.dart';
 
class ProgessBarTimer extends StatefulWidget {
  @override
  _ProgessBarTimerState createState() => _ProgessBarTimerState();
}
class _ProgessBarTimerState extends State<ProgessBarTimer> {
  double _progress = 0.0;
  late Timer timer;
  void startTimer() {
    timer = Timer.periodic(
      Duration(seconds: 1),
      (Timer timer) => setState(() {
        if (_progress == 10.0) {
          timer.cancel();
          print("Het gio");
         // context.read<QuizBloc>().nextQuestion(context);
        } else {
          _progress += 1;
          print(_progress);
        }
      }),
    );
  }
 
  @override
  void initState() {
    super.initState();
    startTimer();
  }
 
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }
 
  @override
  void dispose() {
    startTimer();
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.5,
          color: Colors.white.withOpacity(0.5),
        ),
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        child: new Stack(
          children: [
            LinearPercentIndicator(
              animation: true,
              lineHeight: 40,
              animationDuration: 10000,
              percent: 1,
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor:Colors.greenAccent,
              backgroundColor: Colors.transparent,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${_progress.round()}" + " sec",
                    style: TextStyle(color: Colors.green).copyWith(
                        fontWeight: FontWeight.bold),
                  ),
                  SvgPicture.asset(
                    "assets/icons/clock.svg",
                    fit: BoxFit.fill,
                    color: Colors.white
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}