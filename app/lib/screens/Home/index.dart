import 'package:app/screens/Home/styles.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/widgets.dart' as widgets;
import 'package:app/constants/constants.dart' as constants;
import 'package:app/route/route.dart' as route;
import 'package:flutter_bootstrap/flutter_bootstrap.dart';

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

              return BootstrapRow(
                height: 60,
                children: <BootstrapCol>[
                  BootstrapCol(
                    sizes: 'col-xl-2 col-lg-3 col-md-2 col-sm-6 col-xs-6 ',
                    offsets:
                        'offset-0 offset-sm-0 offset-md-1 offset-lg-0 offset-xl-2',
                    child: widgets.SquareRound(
                      icon: constants.Images.phone,
                      product: "Mis ventas",
                      url: route.optionScreen,
                    ),
                  ),
                  BootstrapCol(
                    sizes: 'col-xl-2 col-lg-3 col-md-2 col-sm-6 col-xs-6',
                    child: widgets.SquareRound(
                      icon: constants.Images.sale,
                      product: "Nueva venta",
                      url: route.optionScreen,
                    ),
                  ),
                  BootstrapCol(
                    sizes: 'col-xl-2 col-lg-3 col-md-2 col-sm-6 col-xs-6',
                    child: widgets.SquareRound(
                      icon: constants.Images.phone,
                      product: "Aprendizaje",
                      url: route.optionScreen,
                    ),
                  ),
                  BootstrapCol(
                    sizes: 'col-xl-2 col-lg-3 col-md-2 col-sm-6 col-xs-6',
                    child: widgets.SquareRound(
                      icon: constants.Images.sale,
                      product: "Cotizaciones",
                      url: route.optionScreen,
                    ),
                  ),
                ],
              );

              /* if (hasDetailPage) {
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
                          width: 140,
                          height: 160,
                        ),
                        SizedBox(height: 10),
                        widgets.SquareRound(
                          icon: constants.Images.sale,
                          product: "Mis ventas",
                          url: route.optionScreen,
                          width: 140,
                          height: 160,
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    Column(
                      children: const <Widget>[
                        widgets.SquareRound(
                          icon: constants.Images.learning,
                          product: "Mis ventas",
                          url: route.optionScreen,
                          width: 140,
                          height: 160,
                        ),
                        SizedBox(height: 10),
                        widgets.SquareRound(
                          icon: constants.Images.quote,
                          product: "Mis ventas",
                          url: route.optionScreen,
                          width: 140,
                          height: 160,
                        ),
                      ],
                    ),
                  ],
                );
              } */
            }),
          ),
        ],
      ),
      bottomNavigationBar: const widgets.Footer(),
    );
  }
}

class ContentWidget extends StatelessWidget {
  const ContentWidget({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: color,
      child: Text(text),
    );
  }
}
