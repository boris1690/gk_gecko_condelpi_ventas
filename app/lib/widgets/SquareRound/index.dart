import 'package:flutter/material.dart';
import './styles.dart';
import 'package:app/route/route.dart' as route;
import 'package:app/constants/constants.dart' as constants;
import 'package:app/theme/theme.dart' as theme;

class SquareRound extends StatelessWidget {
  final String icon;
  final String image;
  final String product;
  final String url;
  final double height;
  final double width;
  final bool activeSwitch;
  final bool check;
  final VoidCallback? onTap;
  const SquareRound({
    Key? key,
    this.icon = '',
    this.image = '',
    required this.product,
    this.url = '',
    this.height = 220,
    this.width = 180,
    this.check = false,
    this.activeSwitch = false,
    this.onTap,
  }) : super(key: key);

  Widget imageRender() {
    print('aqui');
    print(image);
    if (icon != '')
      return Image.asset(icon, height: height * 0.3, fit: BoxFit.fill);
    else
      return Image.network(image, height: height * 0.3, fit: BoxFit.fill);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            highlightColor: Colors.transparent,
            onTap: () => onTap != null
                ? onTap?.call()
                : Navigator.pushNamed(context, url),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: height,
                  width: width,
                  /* color: Colors.transparent, */
                  decoration:
                      Styles.boxDecorationStyle(activeSwitch ? check : true),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Center(child: imageRender()),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 5),
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
                if (activeSwitch)
                  Positioned(
                    top: 5,
                    right: 5,
                    child: Container(
                      width: width * 0.1,
                      height: width * 0.1,
                      decoration: Styles.cornerDecorationStyle,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
