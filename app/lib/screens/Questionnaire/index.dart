import 'package:app/core/quote/quote_manager.dart';
import 'package:app/screens/Option/controller/option_controller.dart';
import 'package:app/screens/Questionnaire/widgets/BuildQuestion/index.dart';
import 'package:app/utils/common.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/widgets.dart' as widgets;
import 'package:app/constants/constants.dart' as constants;
import 'package:app/route/route.dart' as route;
import 'package:app/theme/theme.dart' as theme;
import './styles.dart';
import 'package:get/get.dart';

class Questionnaire extends StatefulWidget {
  const Questionnaire({Key? key}) : super(key: key);

  @override
  _QuestionnaireState createState() => _QuestionnaireState();
}

class _QuestionnaireState extends State<Questionnaire> {
  QuoteManager _quoteManager = Get.find();
  Map _quote = {};
  String _type = "";
  String _status = "";
  String _status_option = "";
  int _index = 0;
  int _numberColumns = 0;
  OptionController _controller = Get.put(OptionController());

  _handleParent(option) async {
    // Validate button type
    if (option['tip_respuesta'] == 'B') {
      var action = option['act_respuesta'].split("_");

      // Get data of product
      var product = await _controller.getOptions(
          {"filter[est_producto]": "A", "filter[cod_producto]": action[1]});

      _quoteManager.setQuote({"subproduct": product[0]});
      Navigator.pushNamed(context, route.quoteStep1Screen);
    } else {
      _quote['product']
          .secciones[_index]['preguntas']
          .asMap()
          .forEach((index, pregunta) {
        if (pregunta['cod_pregunta'] == option['cod_pregunta']) {
          // Change value in parent
          pregunta['respuestas'].asMap().forEach((index_1, respuesta) {
            if (respuesta['tip_respuesta'] == option['tip_respuesta']) {
              if (respuesta['cod_respuesta'] == option['cod_respuesta']) {
                _quote['product'].secciones[_index]['preguntas'][index]
                    ['respuestas'][index_1]['selected'] = true;
              } else {
                if (respuesta['tip_respuesta'] != "H") {
                  _quote['product'].secciones[_index]['preguntas'][index]
                      ['respuestas'][index_1]['selected'] = false;
                }
              }
            }
          });

          var _count = 0;
          // Change value in children
          pregunta['respuestas'].asMap().forEach((index_1, respuesta) {
            if (respuesta["cod_respuestapadre"] != -1) {
              if (respuesta["cod_respuestapadre"] == option['cod_respuesta'] &&
                  _count == 0) {
                _quote['product'].secciones[_index]['preguntas'][index]
                    ['respuestas'][index_1]['selected'] = true;
                _count++;
              } else {
                _quote['product'].secciones[_index]['preguntas'][index]
                    ['respuestas'][index_1]['selected'] = false;
              }
            }
          });
        }
      });

      setState(() {});
    }
  }

  _handleChild(option) {
    _quote['product']
        .secciones[_index]['preguntas']
        .asMap()
        .forEach((index, pregunta) {
      if (pregunta['cod_pregunta'] == option['cod_pregunta']) {
        var selected_response = pregunta['respuestas']
            .where((response) =>
                response['selected'] == true &&
                response['cod_respuestapadre'] == -1)
            .toList();

        var selected_subresponse = pregunta['respuestas']
            .where((response) =>
                response['cod_respuesta'] == option['cod_respuesta'])
            .toList();

        if (selected_subresponse[0]['cod_respuestapadre'] == -1 ||
            (selected_response.length > 0 &&
                selected_subresponse[0]['cod_respuestapadre'] ==
                    selected_response[0]['cod_respuesta'])) {
          // Foreach Responses
          pregunta['respuestas'].asMap().forEach(
            (index_1, respuesta) {
              if (respuesta['cod_respuestapadre'] != -1) {
                if (respuesta['cod_respuesta'] == option['cod_respuesta']) {
                  _quote['product'].secciones[_index]['preguntas'][index]
                      ['respuestas'][index_1]['selected'] = true;
                } else {
                  _quote['product'].secciones[_index]['preguntas'][index]
                      ['respuestas'][index_1]['selected'] = false;
                }
              }
            },
          );
        }
      }
    });

    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _quote = _quoteManager.getQuote();

    _numberColumns = _quote['product'].secciones[_index]['num_columnas'];

    //print('preguntas ==>'. _quote['product']);

    setState(() {});
  }

  Widget _buildQuestionnaire() => Expanded(
        child: Column(
          children: [
            ..._quote['product'].preguntas.map((question) {
              var index = _quote['product'].preguntas.indexOf(question) + 1;

              if (index <= (_index + 1) * 2 && index > _index * 2) {
                return Column(children: [
                  BuildQuestion(
                    question: question,
                    handleParent: _handleParent,
                    handleChild: _handleChild,
                  ),
                  SizedBox(height: 40),
                ]);
              }

              return Container();
            }),
          ],
        ),
      );

  onPrevStep() {
    if (_index == 0) {
      Navigator.of(context).pop();
    } else {
      setState(() {
        _index--;
        _numberColumns = _quote['product'].secciones[_index]['num_columnas'];
      });
    }
  }

  onNextStep() {
    if ((_index + 1) == _quote['product'].secciones.length) {
      Navigator.pushNamed(context, route.optionScreen);
    } else {
      setState(() {
        _index++;
        _numberColumns = _quote['product'].secciones[_index]['num_columnas'];
      });
    }

    /* if (!validateProduct()) {
      if (((_index + 1) * 2) == _quote['product'].preguntas.length) {
        Navigator.pushNamed(context, route.optionScreen);
      } else {
        setState(() {
          _index++;
        });
      }
    } */
  }

  validateProduct() {
    var _validate = false;
    var _message = "";

    _quote['product'].preguntas.asMap().forEach((index, pregunta) {
      index = index + 1;
      if (index <= (_index + 1) * 2 && index > _index * 2) {
        //Count number of response selected
        var selected = pregunta['respuestas']
            .where((response) => response['selected'] == true)
            .toList();

        var subrespuestas = (pregunta['subrespuestas'] as List)
            .map((e) => e as Map<String, dynamic>);

        if (subrespuestas.isNotEmpty) {
          var grupByParent =
              groupBy(subrespuestas, (Map obj) => obj['cod_respuestapadre']);

          var selected_subresponse = subrespuestas
              .where((response) => response['selected'] == true)
              .toList();

          if (selected_subresponse.length == 0 && !_validate)
          /* if (grupByParent.length != selected_subresponse.length &&
              !_validate) */
          {
            _validate = true;
            _message =
                "Debe seleccionar una respuesta en " + pregunta['nom_pregunta'];
          }
        }

        if (selected.length == 0 && !_validate) {
          _validate = true;
          _message =
              "Debe seleccionar una respuesta en " + pregunta['nom_pregunta'];
        }
      }
    });

    if (_validate) {
      Get.defaultDialog(
          middleText: _message,
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }

    return _validate;
  }

  _returnListQuestion(preguntas) {
    List widgets = [];
    List respuestas = [];
    preguntas.forEach(
      (pregunta) {
        pregunta['respuestas'].forEach((respuesta) {
          respuestas.add(respuesta);
        });
      },
    );

    List respuestas_temp = respuestas.toList();

    respuestas_temp
        .sort((a, b) => a["ord_respuesta"].compareTo(b["ord_respuesta"]));

    respuestas_temp.forEach((respuesta) {
      widgets.add(
        BuildQuestion(
          question: respuesta,
          handleParent: _handleParent,
          handleChild: _handleChild,
        ),
      );
    });

    return widgets;
  }

  _returnListStaggeredTile(preguntas) {
    List widgets = [];
    List<Map<String, dynamic>> respuestas = [];
    preguntas.forEach(
      (pregunta) {
        pregunta['respuestas'].forEach((respuesta) {
          respuestas.add(respuesta);
        });
      },
    );

    List respuestas_temp = respuestas.toList();

    respuestas_temp
        .sort((a, b) => a["ord_respuesta"].compareTo(b["ord_respuesta"]));

    respuestas_temp.forEach((respuesta) {
      widgets.add(new StaggeredTile.count(
        respuesta['col_respuesta'],
        respuesta['fil_respuesta'],
      ));
    });

    return widgets;
  }

  Widget _buildCard(responsive) => Expanded(
        child: Row(
          children: <Widget>[
            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Text(
                "Seleccione los datos \ndel prospecto:",
                style: Styles.titleStyle,
              ),
            ]),
            SizedBox(height: 20),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const widgets.Header(),
      body: LayoutBuilder(builder: (builder, constraints) {
        var hasDetailPage = constraints.maxWidth > 600;

        var titleRow = Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _quote['product'].secciones[_index]['nom_seccion'],
              style: Styles.titleStyle,
            ),
          ],
        );

        return Column(
          children: [
            titleRow,
            SizedBox(
              height: 20,
            ),
            Container(
              width: 800,
              height: 400,
              child: StaggeredGridView.count(
                  primary: false,
                  key: ObjectKey(_numberColumns),
                  crossAxisCount: _numberColumns,
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                  children: <Widget>[
                    ..._returnListQuestion(
                        _quote['product'].secciones[_index]['preguntas']),
                  ],
                  staggeredTiles: [
                    ..._returnListStaggeredTile(
                        _quote['product'].secciones[_index]['preguntas']),
                  ]),
            ),
          ],
        );

        if (hasDetailPage) {
          return Column(
            children: [
              titleRow,
              Row(
                children: [
                  /* _buildQuestionnaire(), */
                  Expanded(
                    child: Column(
                      children: [
                        Text("Union libre"),
                        Text("Otro"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text("Casado"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text("SOltero"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text("2 a 3 miembros"),
                        Text("+3 miembros"),
                        Text("Otro"),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  /* _buildQuestionnaire(), */
                  Expanded(
                    child: Column(
                      children: [
                        Text("Primer bien"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text("Segundo bien"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text("Otro"),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        } else {
          return Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        titleRow,
                        SizedBox(height: 20),
                        /* _buildQuestionnaire(), */
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        }
      }),
      bottomNavigationBar: widgets.Footer(
        onPrevTap: () => onPrevStep(),
        onNextTap: () => onNextStep(),
      ),
    );
  }
}
