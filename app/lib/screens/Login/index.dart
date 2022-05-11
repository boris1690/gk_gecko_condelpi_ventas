import 'package:app/screens/Login/styles.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/widgets.dart' as widgets;
import 'package:app/constants/constants.dart' as constants;
import 'package:app/route/route.dart' as route;

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const widgets.Header(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Iniciar sesión",
                    style: Styles.fontStyle,
                  ),
                ]),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Container(
                  width: 500,
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    /* controller: nameController, */
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Usuario *',
                    ),
                  ),
                ),
                Container(
                  width: 500,
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    /* controller: nameController, */
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Contraseña *',
                    ),
                  ),
                ),
                Container(
                  width: 500,
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: Styles.buttonStyle,
                    child: Text('Ingresar', style: Styles.fontStyle),
                    onPressed: () {
                      Navigator.pushNamed(context, route.homeScreen);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
