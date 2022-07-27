import 'package:app/screens/Login/controller/login_controller.dart';
import 'package:app/screens/Login/styles.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/widgets.dart' as widgets;
import 'package:app/constants/constants.dart' as constants;
import 'package:app/route/route.dart' as route;
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formKey = GlobalKey();
  LoginController _controller = Get.put(LoginController());
  bool isLoading = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Form loginForm() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: Expanded(
        flex: 3,
        child: Column(
          children: [
            Container(
              width: 500,
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: emailController,
                validator: (value) {
                  return (value == null || value.isEmpty)
                      ? 'Ingrese el usuario'
                      : null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Usuario *',
                ),
              ),
            ),
            Container(
              width: 500,
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                obscureText: true,
                controller: passwordController,
                validator: (value) {
                  return (value == null || value.isEmpty)
                      ? 'Ingrese la contraseña'
                      : null;
                },
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
                child: isLoading
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 1.5,
                        ))
                    : const Text('Ingresar', style: Styles.fontStyle),
                onPressed: () async {
                  if (formKey.currentState?.validate() ?? false) {
                    setState(() {
                      isLoading = true;
                    });
                    await _controller.loginUser(
                        emailController.text, passwordController.text);
                    setState(() {
                      isLoading = false;
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

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
          loginForm(),
        ],
      ),
    );
  }
}
