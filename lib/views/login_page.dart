import 'package:flutter/material.dart';
import 'package:im_hungry/components/my_input.dart';
import 'package:im_hungry/services/firebase_connect.dart';
import 'package:im_hungry/views/home_page.dart';
import 'package:im_hungry/views/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlutterLogo(
            size: 70,
          ),
          MyInput(
            controller: emailController,
            placeholder: 'Email',
            type: false,
          ),
          MyInput(
            controller: passwordController,
            placeholder: 'Senha',
            type: true,
          ),
          ElevatedButton(
            onPressed: () async {
              var auth =
                  await login(emailController.text, passwordController.text);
              if (auth == true) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Usuário ou senha incorretos'),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 3),
                  ),
                );
              }
            },
            child: Text('Entrar'),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () async {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => RegisterPage(),
                ),
              );
            },
            child: Text('Cadastrar'),
          ),
        ],
      ),
    );
  }
}
