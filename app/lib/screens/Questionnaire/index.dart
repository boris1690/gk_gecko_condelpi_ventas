import 'package:flutter/material.dart';
import 'package:app/widgets/widgets.dart' as widgets;
import 'package:app/constants/constants.dart' as constants;
import 'package:app/route/route.dart' as route;
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:app/theme/theme.dart' as theme;
import './styles.dart';

class Questionnaire extends StatefulWidget {
  const Questionnaire({Key? key}) : super(key: key);

  @override
  _QuestionnaireState createState() => _QuestionnaireState();
}

class _QuestionnaireState extends State<Questionnaire> {
  String _type = "";
  String _status = "";
  String _status_option = "";

  void _handleTap(option) {
    setState(() {
      _type = option;
    });
  }

  void _handleStatus(option) {
    setState(() {
      _status = option;
      _status_option = "${option}_1";
    });
  }

  void _handleOption(option) {
    setState(() {
      _status_option = option;
    });
  }

  Widget _buildGrid() => Column(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: Styles.boxDecorationStyle,
            width: 300,
            height: 35,
            child: const Text("Tipo de bien", style: Styles.fontStyle),
          ),
          Container(
            width: 300,
            color: Color(0xFFF5F5F5),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(children: [
                      SizedBox(height: 5),
                      InkWell(
                        onTap: () => _handleTap("1"),
                        child: Container(
                          height: 50.0,
                          width: double.infinity,
                          decoration:
                              Styles.boxDecorationYellowStyle(_type == "1"),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 7,
                                right: 7,
                                child: Icon(
                                  _type == "1"
                                      ? Icons.radio_button_checked_sharp
                                      : Icons.radio_button_off,
                                  size: 15,
                                  color: theme.Colors.whiteColor,
                                ),
                              ),
                              Align(
                                child: Text(
                                  "Primer bien",
                                  style: Styles.fontStyle,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      InkWell(
                        onTap: () => _handleTap("2"),
                        child: Container(
                          height: 50.0,
                          decoration:
                              Styles.boxDecorationYellowStyle(_type == "2"),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 7,
                                right: 7,
                                child: Icon(
                                  _type == "2"
                                      ? Icons.radio_button_checked_sharp
                                      : Icons.radio_button_off,
                                  size: 15,
                                  color: theme.Colors.whiteColor,
                                ),
                              ),
                              Align(
                                child: Text(
                                  "Segundo bien",
                                  style: Styles.fontStyle,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () => _handleTap("3"),
                      child: Container(
                        margin: EdgeInsets.only(top: 5, left: 2),
                        height: 50.0,
                        decoration:
                            Styles.boxDecorationYellowStyle(_type == "3"),
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 7,
                              right: 7,
                              child: Icon(
                                _type == "3"
                                    ? Icons.radio_button_checked_sharp
                                    : Icons.radio_button_off,
                                size: 15,
                                color: theme.Colors.whiteColor,
                              ),
                            ),
                            Align(
                              child: Text(
                                "Otro",
                                style: Styles.fontStyle,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );

  Widget _buildGrid2() => Column(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: Styles.boxDecorationStyle,
            width: 300,
            height: 35,
            child: const Text("Estado civil", style: Styles.fontStyle),
          ),
          Container(
            width: 300,
            color: Color(0xFFF5F5F5),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () => _handleStatus("C"),
                      child: Container(
                        margin: EdgeInsets.only(top: 5, right: 2),
                        height: 50.0,
                        decoration:
                            Styles.boxDecorationYellowStyle(_status == "C"),
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 7,
                              right: 7,
                              child: Icon(
                                _status == "C"
                                    ? Icons.radio_button_checked_sharp
                                    : Icons.radio_button_off,
                                size: 15,
                                color: theme.Colors.whiteColor,
                              ),
                            ),
                            Align(
                              child: Text(
                                "Casado",
                                style: Styles.fontStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        SizedBox(height: 5),
                        InkWell(
                          onTap: () => _handleOption("C_1"),
                          child: Container(
                            height: 35.0,
                            decoration: Styles.boxDecorationYellowStyle(
                                _status_option == "C_1"),
                            alignment: Alignment.center,
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 7,
                                  right: 7,
                                  child: Icon(
                                    _status_option == "C_1"
                                        ? Icons.radio_button_checked_sharp
                                        : Icons.radio_button_off,
                                    size: 15,
                                    color: theme.Colors.whiteColor,
                                  ),
                                ),
                                Align(
                                  child: Text(
                                    "2 a 3 miembros",
                                    style: Styles.fontStyle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        InkWell(
                          onTap: () => _handleOption("C_2"),
                          child: Container(
                            height: 35.0,
                            decoration: Styles.boxDecorationYellowStyle(
                                _status_option == "C_2"),
                            alignment: Alignment.center,
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 7,
                                  right: 7,
                                  child: Icon(
                                    _status_option == "C_2"
                                        ? Icons.radio_button_checked_sharp
                                        : Icons.radio_button_off,
                                    size: 15,
                                    color: theme.Colors.whiteColor,
                                  ),
                                ),
                                Align(
                                  child: Text(
                                    "+ 3 miembros",
                                    style: Styles.fontStyle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        InkWell(
                          onTap: () => _handleOption("C_3"),
                          child: Container(
                            height: 35.0,
                            decoration: Styles.boxDecorationYellowStyle(
                              _status_option == "C_3",
                            ),
                            alignment: Alignment.center,
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 7,
                                  right: 7,
                                  child: Icon(
                                    _status_option == "C_3"
                                        ? Icons.radio_button_checked_sharp
                                        : Icons.radio_button_off,
                                    size: 15,
                                    color: theme.Colors.whiteColor,
                                  ),
                                ),
                                Align(
                                  child: Text(
                                    "Otro",
                                    style: Styles.fontStyle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 300,
            color: Color(0xFFF5F5F5),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () => _handleStatus("S"),
                      child: Container(
                        margin: EdgeInsets.only(top: 5, right: 2),
                        height: 50.0,
                        decoration:
                            Styles.boxDecorationYellowStyle(_status == "S"),
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 7,
                              right: 7,
                              child: Icon(
                                _status == "S"
                                    ? Icons.radio_button_checked_sharp
                                    : Icons.radio_button_off,
                                size: 15,
                                color: theme.Colors.whiteColor,
                              ),
                            ),
                            Align(
                              child: Text(
                                "Soltero",
                                style: Styles.fontStyle,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        SizedBox(height: 5),
                        InkWell(
                          onTap: () => _handleOption("S_1"),
                          child: Container(
                            height: 50.0,
                            decoration: Styles.boxDecorationYellowStyle(
                              _status_option == "S_1",
                            ),
                            alignment: Alignment.center,
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 7,
                                  right: 7,
                                  child: Icon(
                                    _status_option == "S_1"
                                        ? Icons.radio_button_checked_sharp
                                        : Icons.radio_button_off,
                                    size: 15,
                                    color: theme.Colors.whiteColor,
                                  ),
                                ),
                                Align(
                                  child: Text(
                                    "19 años o más",
                                    style: Styles.fontStyle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        InkWell(
                          onTap: () => _handleOption("S_2"),
                          child: Container(
                            height: 50.0,
                            decoration: Styles.boxDecorationYellowStyle(
                              _status_option == "S_2",
                            ),
                            alignment: Alignment.center,
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 7,
                                  right: 7,
                                  child: Icon(
                                    _status_option == "S_2"
                                        ? Icons.radio_button_checked_sharp
                                        : Icons.radio_button_off,
                                    size: 15,
                                    color: theme.Colors.whiteColor,
                                  ),
                                ),
                                Align(
                                  child: Text(
                                    "Menor de 19 años",
                                    style: Styles.fontStyle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );

  Widget _buildQuestionnaire() => Expanded(
        child: Column(
          children: [
            _buildGrid(),
            SizedBox(height: 40),
            _buildGrid2(),
          ],
        ),
      );

  Widget _buildCard() => Expanded(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Text(
                "Seleccione los datos \ndel prospecto:",
                style: Styles.titleStyle,
              ),
            ]),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                widgets.SquareRound(
                  icon: constants.Images.car,
                  product: "Auto",
                  url: "",
                  check: true,
                  height: 160,
                  width: 120,
                )
              ],
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const widgets.Header(),
      body: LayoutBuilder(builder: (builder, constraints) {
        var hasDetailPage = constraints.maxWidth > 600;

        if (hasDetailPage) {
          return Row(children: [
            _buildCard(),
            _buildQuestionnaire(),
          ]);
        } else {
          return Column(
            children: [
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    _buildCard(),
                    SizedBox(height: 20),
                    _buildQuestionnaire(),
                  ],
                ),
              ),
            ],
          );
        }
      }),
      bottomNavigationBar: const widgets.Footer(),
    );
  }
}
