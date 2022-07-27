import 'package:flutter/material.dart';
import 'package:super_rich_text/super_rich_text.dart';
import './styles.dart';
import 'package:app/theme/theme.dart' as theme;
import 'package:app/constants/constants.dart' as constants;

class BuildQuestion extends StatefulWidget {
  final dynamic? question;
  final Function? handleParent;
  final Function? handleChild;
  const BuildQuestion({
    Key? key,
    this.question,
    required this.handleParent,
    required this.handleChild,
  }) : super(key: key);

  @override
  State<BuildQuestion> createState() => _BuildQuestionState();
}

class _BuildQuestionState extends State<BuildQuestion> {
  @override
  Widget build(BuildContext context) {
    /* String _type = "";
    int _columns = 2;
    String _status_option = "";
    String _status = ""; */

    if (widget.question['tip_respuesta'] == 'E')
      return Container();
    else if (widget.question['tip_respuesta'] == 'T') return _buildComponent();

    return InkWell(
      onTap: () => {
        if (widget.question['cod_respuestapadre'] == -1)
          widget.handleParent?.call(widget.question)
        else
          widget.handleChild?.call(widget.question)
      },
      child: _buildComponent(),
    );
  }

  Widget _buildComponent() => Container(
        margin: EdgeInsets.only(top: 5, left: 2),
        decoration: Styles.boxDecorationCustomStyle(
          widget.question?['selected'],
          widget.question['bac_respuesta'],
          widget.question['tip_respuesta'],
        ),
        alignment: Alignment.center,
        child: Stack(
          children: [
            widget.question['tip_respuesta'] != 'B' &&
                    widget.question['tip_respuesta'] != 'T'
                ? Positioned(
                    top: 7,
                    right: 7,
                    child: Icon(
                      widget.question?['selected'] == true
                          ? Icons.radio_button_on
                          : Icons.radio_button_off,
                      size: 15,
                      color: widget.question['tip_respuesta'] == 'H'
                          ? theme.Colors.yellowColor
                          : theme.Colors.whiteColor,
                    ),
                  )
                : Container(),
            Align(
              alignment: (widget.question['tip_respuesta'] == "B" ||
                      widget.question['tip_respuesta'] == "T")
                  ? Alignment.center
                  : Alignment.centerLeft,
              child: Container(
                margin: (widget.question['tip_respuesta'] == "B" ||
                        widget.question['tip_respuesta'] == "T")
                    ? const EdgeInsets.only(left: 0.0)
                    : const EdgeInsets.only(left: 20.0),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    if (widget.question['ico_respuesta'] != null) ...[
                      Icon(
                        IconData(
                          int.parse(widget.question['ico_respuesta']),
                          fontFamily: 'MaterialIcons',
                        ),
                        color: theme.Colors.whiteColor,
                      ),
                      const SizedBox(
                        width: 10,
                      )
                    ],
                    SuperRichText(
                      text: widget.question['nom_respuesta'],
                      style: Styles.fontStyle(
                        widget.question['tip_respuesta'],
                        widget.question['fon_respuesta'],
                      ),
                      othersMarkers: [
                        MarkerText(
                          marker: '<f>',
                          /* functions: [
                        () => print('function 1'),
                        () => print('function 2')
                      ], */
                          /* onError: (i, msg) =>  print('$i -> $msg'), */
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
