import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_viewprogress.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final _stepsText = ["2"];
  final _stepCircleRadius = 20.0;
  final _stepProgressViewHeight = 150.0;
  Color _activeColor = Colors.lightBlue;
  Color _inactiveColor = Colors.grey;
  TextStyle _headerStyle =
  TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold);
  TextStyle _stepStyle = TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold);
  Size _safeAreaSize;
  int _curPage = 1;

  StepProgressView _getStepProgress() {
    return StepProgressView(
      _stepsText,
      _curPage,
      _stepProgressViewHeight,
      _safeAreaSize.width,
      _stepCircleRadius,
      _activeColor,
      _inactiveColor,
      _headerStyle,
      _stepStyle,
      decoration: BoxDecoration(color: Colors.amberAccent),
      padding: EdgeInsets.only(
        top: 48.0,
        left: 124.0,
        right: 124.0,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
           height: 150.0,
            width: 100.0,
            child: _getStepProgress()),
        ],
      ),
    );
  }
}
