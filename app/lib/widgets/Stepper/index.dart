import 'package:flutter/material.dart';
import 'package:app/widgets/Stepper/styles.dart';
import 'package:app/theme/theme.dart' as theme;

class Stepper extends StatelessWidget {
  final double width;
  final totalSteps;
  final int curStep;
  final Color stepCompleteColor;
  final Color currentStepColor;
  final Color inactiveColor;
  final double lineWidth;
  Stepper({
    key,
    required this.width,
    required this.curStep,
    required this.stepCompleteColor,
    required this.totalSteps,
    required this.inactiveColor,
    required this.currentStepColor,
    required this.lineWidth,
  })  : assert(curStep > 0 == true && curStep <= totalSteps + 1),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: Styles.boxDecorationStyle,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 10.0,
              left: 84.0,
              right: 84.0,
            ),
            width: this.width,
            child: Column(
              children: [_steps()[0]],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 10.0,
              left: 90.0,
              right: 70.0,
            ),
            width: this.width,
            child: Column(
              children: [_steps()[1]],
            ),
          ),
        ],
      ),
    );
  }

  getCircleColor(i) {
    var color;
    if (i + 1 < curStep) {
      color = stepCompleteColor;
    } else if (i + 1 == curStep)
      color = currentStepColor;
    else
      color = Colors.white;
    return color;
  }

  getBorderColor(i) {
    var color;
    if (i + 1 < curStep) {
      color = stepCompleteColor;
    } else if (i + 1 == curStep)
      color = currentStepColor;
    else
      color = inactiveColor;

    return color;
  }

  getLineColor(i) {
    var color = curStep > i + 1 ? Colors.grey[300] : Colors.grey[300];
    return color;
  }

  List<Widget> _steps() {
    var list = <Widget>[];
    var listTitles = <Widget>[];
    for (int i = 0; i < totalSteps; i++) {
      //colors according to state

      var circleColor = getCircleColor(i);
      var borderColor = getBorderColor(i);
      var lineColor = getLineColor(i);

      // step circles
      list.add(Stack(
        children: [
          Container(
            width: 38.0,
            height: 38.0,
            child: getInnerElementOfStepper(i),
            decoration: new BoxDecoration(
              color: circleColor,
              borderRadius: new BorderRadius.all(new Radius.circular(25.0)),
              border: new Border.all(
                color: borderColor,
                width: 1.0,
              ),
            ),
          ),
        ],
      ));
      var title = "";
      switch (i) {
        case 0:
          title = "INFO\nPLAN";
          break;
        case 1:
          title = "INFO\nECONÓMICA";
          break;
        case 2:
          title = "INFO\nCLIENTE";
          break;
        case 3:
          title = "COTIZACIÓN\nCLIENTE";
          break;
      }

      listTitles.add(
        Container(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: Styles.fontStyle,
          ),
        ),
      );

      //line between step circles
      if (i != totalSteps - 1) {
        list.add(
          Expanded(
            child: Container(
              height: lineWidth,
              color: lineColor,
            ),
          ),
        );

        listTitles.add(
          Expanded(
            child: Container(
              height: lineWidth,
              color: Colors.transparent,
            ),
          ),
        );
      }
    }

    return [
      Row(children: [...list]),
      Row(children: [...listTitles]),
    ];
  }

  Widget getInnerElementOfStepper(index) {
    if (index + 1 < curStep) {
      return Icon(
        Icons.check,
        color: Colors.white,
        size: 16.0,
      );
    } else if (index + 1 == curStep) {
      return Center(
        child: Text(
          '$curStep',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
            fontSize: 20,
          ),
        ),
      );
    } else
      return Center(
        child: Text(
          '${index + 1}',
          style: TextStyle(
            color: theme.Colors.primaryColor,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
            fontSize: 20,
          ),
        ),
      );
  }
}
