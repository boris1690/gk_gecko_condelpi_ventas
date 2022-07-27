import 'package:flutter/material.dart';
import './styles.dart';
import 'package:app/theme/theme.dart' as theme;
import 'package:app/constants/constants.dart' as constants;

class Footer extends StatelessWidget {
  final VoidCallback? onNextTap;
  final VoidCallback? onPrevTap;
  const Footer({
    Key? key,
    this.onNextTap,
    this.onPrevTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: Styles.boxDecorationStyle,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center, // Optional
        children: [
          InkWell(
            onTap: () {
              onPrevTap?.call();
            },
            child: Row(
              children: [
                Image.asset(
                  constants.Images.back,
                  fit: BoxFit.contain,
                  width: 20,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Atrás",
                  style: Styles.fontStyle,
                ),
              ],
            ),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              child: Icon(
                Icons.home_outlined,
                color: Colors.white,
                size: 30,
              ),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(20),
                primary: theme.Colors.yellowColor,
                onPrimary: theme.Colors.primaryColor,
              ),
            ),
          ),
          Container(
            child: InkWell(
              onTap: () {
                onNextTap?.call();
              },
              child: Row(
                children: [
                  Text(
                    "Siguiente",
                    style: Styles.fontStyle,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    constants.Images.next,
                    fit: BoxFit.contain,
                    width: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
