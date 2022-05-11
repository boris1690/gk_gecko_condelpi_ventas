import 'package:app/screens/Home/styles.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/widgets.dart' as widgets;
import 'package:app/constants/constants.dart' as constants;
import 'package:app/route/route.dart' as route;

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
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

              if (hasDetailPage) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    widgets.SquareRound(
                      icon: constants.Images.phone,
                      product: "Mis ventas",
                      url: route.optionScreen,
                    ),
                    SizedBox(width: 10),
                    widgets.SquareRound(
                      icon: constants.Images.sale,
                      product: "Nueva venta",
                      url: route.optionScreen,
                    ),
                    SizedBox(width: 10),
                    widgets.SquareRound(
                      icon: constants.Images.learning,
                      product: "Aprendizaje",
                      url: route.optionScreen,
                    ),
                    SizedBox(width: 10),
                    widgets.SquareRound(
                      icon: constants.Images.quote,
                      product: "Cotizaciones",
                      url: route.optionScreen,
                    ),
                  ],
                );
              } else {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: const <Widget>[
                        widgets.SquareRound(
                          icon: constants.Images.phone,
                          product: "Mis ventas",
                          url: route.optionScreen,
                        ),
                        widgets.SquareRound(
                          icon: constants.Images.sale,
                          product: "Mis ventas",
                          url: route.optionScreen,
                        ),
                      ],
                    ),
                    Column(
                      children: const <Widget>[
                        widgets.SquareRound(
                          icon: constants.Images.learning,
                          product: "Mis ventas",
                          url: route.optionScreen,
                        ),
                        widgets.SquareRound(
                          icon: constants.Images.quote,
                          product: "Mis ventas",
                          url: route.optionScreen,
                        ),
                      ],
                    ),
                  ],
                );
              }
            }),
          ),
        ],
      ),
      bottomNavigationBar: const widgets.Footer(),
    );
  }
}
