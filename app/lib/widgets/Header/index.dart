import 'package:flutter/material.dart';
import './styles.dart';
import 'package:app/theme/theme.dart' as theme;
import 'package:app/constants/constants.dart' as constants;

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({Key? key}) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(80);

  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      toolbarHeight: 80,
      leadingWidth: 180,
      leading: Container(
        padding: const EdgeInsets.all(15.0),
        margin: const EdgeInsets.only(left: 15, top: 15),
        child: Image.asset(
          constants.Images.logo,
          fit: BoxFit.fill,
        ),
      ),
      /* title: const Text('rr'), */
      actions: [
        IconButton(
          icon: const Icon(Icons.menu, color: theme.Colors.primaryColor),
          onPressed: () {},
        ),
        // add more IconButton
      ],
    );
  }
}
