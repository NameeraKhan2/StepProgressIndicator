import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class StepProgressView extends StatefulWidget {
  const StepProgressView(
      List<String> stepsText,
      int curStep,
      double height,
      double width,
      double dotRadius,
      Color activeColor,
      Color inactiveColor,
      TextStyle headerStyle,
      TextStyle stepsStyle, {
        Key key,
        this.decoration,
        this.padding,
        this.lineHeight = 2.0,
      })  : _stepsText = stepsText,
        _curStep = curStep,
        _height = height,
        _width = width,
        _dotRadius = dotRadius,
        _activeColor = activeColor,
        _inactiveColor = inactiveColor,
        _headerStyle = headerStyle,
        _stepStyle = stepsStyle,
        assert(curStep > 0 == true && curStep <= stepsText.length),
        assert(width > 0),
        assert(height >= 2 * dotRadius),
        assert(width >= dotRadius * 2 * stepsText.length),
        super(key: key);

  //height of the container
  final double _height;
  //width of the container
  final double _width;
  //container decoration
  final BoxDecoration decoration;
  //list of texts to be shown for each step
  final List<String> _stepsText;
  //cur step identifier
  final int _curStep;
  //active color
  final Color _activeColor;
  //in-active color
  final Color _inactiveColor;
  //dot radius
  final double _dotRadius;
  //container padding
  final EdgeInsets padding;
  //line height
  final double lineHeight;
  //header textstyle
  final TextStyle _headerStyle;
  //steps text
  final TextStyle _stepStyle;

  @override
  State<StepProgressView> createState() => _StepProgressViewState();
}

class _StepProgressViewState extends State<StepProgressView> {
  List<Widget> _buildDots() {
    var wids = <Widget>[];
    widget._stepsText.asMap().forEach((i, text) {
      var circleColor =
      (i == 0 || widget._curStep > i + 1) ? widget._activeColor : widget._inactiveColor;

      var lineColor = widget._curStep > i + 1 ? widget._activeColor : widget._inactiveColor;

      wids.add(
          CircleAvatar(
            radius: widget._dotRadius,
            child: Text("1",style: TextStyle(color: Colors.black87),),
            backgroundColor: circleColor,
          ));

      //add a line separator
      //0-------0--------0
      if (i != widget._stepsText.length - 1) {
        wids.add(
          Expanded(
            child: Container(
              height: widget.lineHeight,
              color: lineColor,
            ),
          ),
        );
      }
    });

    return wids;
  }

  List<Widget> _buildText() {
    var wids = <Widget>[];
    widget._stepsText.asMap().forEach((i, text) {
      wids.add(Text(text, style: widget._stepStyle));
    });

    return wids;
  }

  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      height: this.widget._height,
      width: this.widget._width,
      decoration: this.widget.decoration,
      child: Column(
        children: <Widget>[
          Container(
            child: Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: (widget._curStep).toString(),
                      style: widget._headerStyle.copyWith(
                        color: widget._activeColor, //this is always going to be active
                      ),
                    ),
                    TextSpan(
                      text: " / " + widget._stepsText.length.toString(),
                      style: widget._headerStyle.copyWith(
                        color: widget._curStep == widget._stepsText.length
                            ? widget._activeColor
                            : widget._inactiveColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            children: _buildDots(),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _buildText(),
          ),
        ],
      ),
    );
  }
}