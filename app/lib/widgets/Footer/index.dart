import 'package:flutter/material.dart';
import './styles.dart';
import 'package:app/theme/theme.dart' as theme;
import 'package:app/constants/constants.dart' as constants;

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center, // Optional
        mainAxisAlignment:
            MainAxisAlignment.spaceEvenly, // Change to your own spacing
        children: [
          Container(
            child: Icon(Icons.arrow_back_ios, color: theme.Colors.yellowColor),
          ),
          Expanded(
            child: Container(
              child: Icon(Icons.home_outlined, color: theme.Colors.yellowColor),
            ),
          ),
          Container(
            child:
                Icon(Icons.arrow_forward_ios, color: theme.Colors.yellowColor),
          ),
        ],
      ),
    );
  }
}
