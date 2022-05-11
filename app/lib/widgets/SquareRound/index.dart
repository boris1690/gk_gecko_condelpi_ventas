import 'package:flutter/material.dart';
import './styles.dart';
import 'package:app/route/route.dart' as route;
import 'package:app/constants/constants.dart' as constants;
import 'package:app/theme/theme.dart' as theme;

class SquareRound extends StatelessWidget {
  final String icon;
  final String product;
  final String url;
  final double height;
  final double width;
  final bool check;
  const SquareRound(
      {Key? key,
      required this.icon,
      required this.product,
      required this.url,
      this.height = 240.0,
      this.width = 190.0,
      this.check = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, url),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: height,
            width: width,
            /* color: Colors.transparent, */
            decoration: Styles.boxDecorationStyle,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Center(
                    child: Image.asset(icon,
                        height: height * 0.3, fit: BoxFit.fill),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Center(
                    child: Text(
                      product,
                      style: Styles.fontStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (check)
            Positioned(
              top: -30,
              right: -30,
              child: Container(
                width: width * 0.5,
                height: width * 0.5,
                decoration: Styles.cornerDecorationStyle,
                child: Icon(
                  Icons.check_circle_outline,
                  color: theme.Colors.greenColor,
                  size: width * 0.4,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
