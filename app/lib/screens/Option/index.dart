import 'package:flutter/material.dart';
import 'package:app/screens/Home/styles.dart';
import 'package:app/widgets/widgets.dart' as widgets;
import 'package:app/constants/constants.dart' as constants;
import 'package:app/route/route.dart' as route;

class Option extends StatelessWidget {
  const Option({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const widgets.Header(),
      body: Column(
        /* mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center, */
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Seleccione una opción:",
                    style: Styles.fontStyle,
                  ),
                ]),
          ),
          Expanded(
            flex: 3,
            child: LayoutBuilder(builder: (builder, constraints) {
              var hasDetailPage = constraints.maxWidth > 600;

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  widgets.SquareRound(
                    icon: constants.Images.car,
                    product: "Auto",
                    url: route.questionnaireScreen,
                  ),
                  SizedBox(width: 10),
                  widgets.SquareRound(
                    icon: constants.Images.home,
                    product: "Casa",
                    url: route.questionnaireScreen,
                  ),
                ],
              );
            }),
          ),
        ],
      ),
      bottomNavigationBar: const widgets.Footer(),
    );
  }
}
