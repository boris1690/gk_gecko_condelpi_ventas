import 'package:app/core/quote/quote_manager.dart';
import 'package:app/screens/Option/controller/option_controller.dart';
import 'package:flutter/material.dart';
import 'package:app/screens/Home/styles.dart';
import 'package:app/widgets/widgets.dart' as widgets;
import 'package:app/constants/constants.dart' as constants;
import 'package:app/route/route.dart' as route;
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';

class Option extends StatefulWidget {
  const Option({Key? key}) : super(key: key);

  @override
  State<Option> createState() => _OptionState();
}

class _OptionState extends State<Option> {
  List _allProducts = [];
  List _products = [];
  Map _quote = {};
  OptionController _controller = Get.put(OptionController());
  QuoteManager _quoteManager = Get.find();

  @override
  void initState() {
    super.initState();

    _quote = _quoteManager.getQuote();

    getCatalog();
  }

  void getCatalog() async {
    try {
      _allProducts = await _controller
          .getOptions({"filter[est_producto]": "A", "secciones": "S"});

      _products = _allProducts
          .where((product) => product.cod_productopadre == -1)
          .toList();

      if (_quote.containsKey('product')) {
        filterProducts(_quote['product'].cod_producto);
      }

      setState(() {});
    } catch (error) {
      print(error);
    }
  }

  void filterProducts(int value) {
    _products = _allProducts
        .where((product) => product.cod_productopadre == value)
        .toList();
    setState(() {});
  }

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
                children: const <Widget>[
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
                  ..._products.map((product) {
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
                      default:
                    }

                    var onTap = null;
                    var url = '';

                    /* if (product.cod_productopadre == -1) {
                      onTap = () => filterProducts(product.cod_producto);
                    } else { */

                    onTap = () {
                      /* url = route.questionnaireScreen; */
                      _quoteManager.setQuote({"product": product});
                      Navigator.pushNamed(context, route.questionnaireScreen);
                    };
                    /* } */

                    return BootstrapCol(
                      sizes:
                          'col-xl-${col_xl} col-lg-${col_lg} col-md-${col_md} col-sm-${col_sm} col-xs-${col_xs}',
                      offsets:
                          'offset-sm-${off_sm} offset-md-${off_md} offset-lg-${off_lg} offset-xl-${off_xl}',
                      child: widgets.SquareRound(
                        image: product.ico_producto,
                        product: product.nom_producto,
                        onTap: onTap,
                      ),
                    );
                  })
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
