import 'package:app/core/quote/quote_manager.dart';
import 'package:app/screens/Option/controller/option_controller.dart';
import 'package:app/screens/Option/model/option_response_model.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/widgets.dart' as widgets;
import 'package:app/constants/constants.dart' as constants;
import 'package:app/route/route.dart' as route;
import 'package:app/theme/theme.dart' as theme;
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import './styles.dart';
import 'package:get/get.dart';

class Step2 extends StatefulWidget {
  const Step2({Key? key}) : super(key: key);

  @override
  _Step2State createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  QuoteManager _quoteManager = Get.find();
  OptionController _controller = Get.put(OptionController());
  Map _quote = {};
  double _value = 800.0;
  double _value1 = 800.0;
  String _type = "";
  String _status = "";
  String _status_option = "";
  List<OptionResponseModel>? _allProducts = [];
  List _products = [];

  @override
  void initState() {
    super.initState();

    _quote = _quoteManager.getQuote();

    getCatalog();
  }

  void getCatalog() async {
    _allProducts = await _controller.getOptions({"filter[est_producto]": "A"});

    /*   _products = _allProducts
        .where((product) => product.cod_productopadre != -1)
        .toList(); */

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const widgets.Header(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            widgets.Stepper(
              totalSteps: 4,
              width: MediaQuery.of(context).size.width,
              curStep: 2,
              stepCompleteColor: theme.Colors.grayColor,
              currentStepColor: theme.Colors.yellowColor,
              inactiveColor: theme.Colors.whiteColor,
              lineWidth: 3.5,
            ),
            BootstrapCol(
              child: SizedBox(height: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Expanded(
                  child: Divider(
                    indent: 100.0,
                    endIndent: 100.0,
                    thickness: 1.5,
                  ),
                ),
              ],
            ),
            BootstrapCol(
              child: SizedBox(height: 20),
            ),
            BootstrapRow(
              children: <BootstrapCol>[
                BootstrapCol(
                  sizes: 'col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12',
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Spacer(),
                      Container(
                        decoration: Styles.boxDecorationCircleStyle,
                        width: 40,
                        height: 40,
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            style: Styles.fontCircleStyle,
                            textAlign: TextAlign.center,
                            "2",
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Información económica',
                        style: Styles.fontCircleTextStyle,
                      ),
                      Expanded(
                        child: Text(''),
                      ),
                    ],
                  ),
                ),
                BootstrapCol(
                  child: SizedBox(height: 20),
                ),
                ..._products.map(
                  (product) {
                    var index = _products.indexOf(product);
                    var length = _products.length;
                    var col_xl = 0;
                    var col_lg = 0;
                    var col_md = 0;
                    var col_sm = 0;
                    var col_xs = 0;
                    var off_xl = 0;
                    var off_lg = 0;
                    var off_md = 0;
                    var off_sm = 0;
                    var off_xs = 0;

                    switch (length) {
                      case 1:
                        col_xl = 12;
                        col_lg = 12;
                        col_md = 12;
                        col_sm = 12;
                        col_xs = 12;
                        off_xl = 0;
                        off_lg = 0;
                        off_md = 0;
                        off_sm = 0;
                        off_xs = 0;
                        break;
                      case 2:
                        col_xl = 2;
                        col_lg = 3;
                        col_md = 3;
                        col_sm = 4;
                        col_xs = 6;
                        off_xl = 0;
                        off_lg = 0;
                        off_md = 0;
                        off_sm = 0;
                        off_xs = 0;

                        if (index == 0) {
                          off_xl = 4;
                          off_lg = 3;
                          off_md = 3;
                          off_sm = 2;
                          off_xs = 0;
                        }
                        break;
                      case 3:
                        col_xl = 2;
                        col_lg = 3;
                        col_md = 3;
                        col_sm = 4;
                        col_xs = 6;
                        off_xl = 0;
                        off_lg = 0;
                        off_md = 0;
                        off_sm = 0;
                        off_xs = 0;

                        if (index == 0) {
                          off_xl = 3;
                          off_lg = 3;
                          off_md = 3;
                          off_sm = 2;
                          off_xs = 0;
                        }
                        break;
                      case 4:
                        col_xl = 2;
                        col_lg = 3;
                        col_md = 3;
                        col_sm = 4;
                        col_xs = 6;
                        off_xl = 0;
                        off_lg = 0;
                        off_md = 0;
                        off_sm = 0;
                        off_xs = 0;

                        if (index == 0) {
                          off_xl = 4;
                          off_lg = 3;
                          off_md = 3;
                          off_sm = 2;
                          off_xs = 0;
                        }
                        break;
                      default:
                    }

                    var onTap = null;
                    var url = '';

                    if (product.cod_productopadre == -1) {
                      onTap = () => null;
                    } else {
                      //_quoteManager.setQuote({product: product});

                      onTap = () {
                        /* url = route.questionnaireScreen; */
                        _quoteManager.setQuote({"product": product});
                        Navigator.pushNamed(context, route.questionnaireScreen);
                      };
                    }

                    return BootstrapCol(
                      sizes:
                          'col-xl-${col_xl} col-lg-${col_lg} col-md-${col_md} col-sm-${col_sm} col-xs-${col_xs}',
                      offsets:
                          'offset-sm-${off_sm} offset-md-${off_md} offset-lg-${off_lg} offset-xl-${off_xl}',
                      child: widgets.SquareRound(
                        icon: index == 0
                            ? constants.Images.building
                            : index == 1
                                ? constants.Images.caseicon
                                : constants.Images.person,
                        product: index == 0
                            ? 'Dependiente'
                            : index == 1
                                ? 'Independiente'
                                : 'Jubilado',
                        onTap: onTap,
                        height: 150,
                        activeSwitch: true,
                        check: index == 0,
                      ),
                    );
                  },
                ),
                BootstrapCol(
                  child: SizedBox(height: 20),
                ),
                BootstrapCol(
                  child: SizedBox(height: 20),
                ),
                BootstrapCol(
                  sizes: "col-xl-6",
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Ingresos",
                            style: Styles.fontTitleStyle,
                          ),
                          Expanded(child: Text('')),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(child: Text('')),
                          Text(
                            "\$$_value",
                            style: Styles.fontRangeStyle,
                          ),
                          Expanded(child: Text('')),
                        ],
                      ),
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: SfSlider(
                            activeColor: theme.Colors.primaryColor,
                            inactiveColor: Colors.grey[200],
                            min: 0.0,
                            max: 5000.0,
                            stepSize: 100,
                            value: _value,
                            minorTicksPerInterval: 1,
                            interval: 500,
                            showTicks: true,
                            showLabels: false,
                            enableTooltip: false,
                            onChanged: (dynamic value) {
                              setState(() {
                                _value = value;
                              });
                            },
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Text(
                            "\$0.0",
                            style: Styles.fontRangeStyle,
                          ),
                          Expanded(child: Text('')),
                          Text(
                            "\$5.0000",
                            style: Styles.fontRangeStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                BootstrapCol(
                  sizes: "col-xl-6",
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Gastos",
                            style: Styles.fontTitleStyle,
                          ),
                          Expanded(child: Text('')),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(child: Text('')),
                          Text(
                            "\$$_value1",
                            style: Styles.fontRangeStyle,
                          ),
                          Expanded(child: Text('')),
                        ],
                      ),
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: SfSlider(
                            activeColor: theme.Colors.primaryColor,
                            inactiveColor: Colors.grey[200],
                            min: 0.0,
                            max: 5000.0,
                            stepSize: 100,
                            value: _value1,
                            minorTicksPerInterval: 1,
                            interval: 500,
                            showTicks: true,
                            showLabels: false,
                            enableTooltip: false,
                            onChanged: (dynamic value) {
                              setState(() {
                                _value1 = value;
                              });
                            },
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Text(
                            "\$0.0",
                            style: Styles.fontRangeStyle,
                          ),
                          Expanded(child: Text('')),
                          Text(
                            "\$5.0000",
                            style: Styles.fontRangeStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                BootstrapCol(
                  child: SizedBox(height: 20),
                ),
                BootstrapCol(
                  sizes: "col-xl-5",
                  offsets: "offset-xl-1",
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      /* controller: emailController, */
                      validator: (value) {
                        return (value == null || value.isEmpty)
                            ? 'Ingrese el usuario'
                            : null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'E-MAIL *',
                      ),
                    ),
                  ),
                ),
                BootstrapCol(
                  sizes: "col-xl-5",
                  child: Container(
                    width: 500,
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      /* controller: emailController, */
                      validator: (value) {
                        return (value == null || value.isEmpty)
                            ? 'Ingrese el usuario'
                            : null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'CÉDULA/PASAPORTE *',
                      ),
                    ),
                  ),
                ),
                BootstrapCol(
                  sizes: "col-xl-5",
                  offsets: "offset-xl-1",
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      /* controller: emailController, */
                      validator: (value) {
                        return (value == null || value.isEmpty)
                            ? 'Ingrese el usuario'
                            : null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'TELÉFONO *',
                      ),
                    ),
                  ),
                ),
                BootstrapCol(
                  sizes: "col-xl-5",
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          primary: theme.Colors.primaryColor,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 22),
                          textStyle: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      onPressed: () {
                        // Respond to button press
                      },
                      icon: Icon(Icons.add, size: 18),
                      label: Text("AUTORIZACION BURO"),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const widgets.Footer(),
    );
  }
}
