import 'package:flutter/material.dart';
import 'package:im_hungry/components/my_input.dart';
import 'package:im_hungry/services/firebase_connect.dart';
import 'package:im_hungry/views/home_page.dart';
import 'package:im_hungry/views/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController userController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  Future<void> handleRegister() async {
    if (userController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        rePasswordController.text.isEmpty ||
        phoneNumberController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Todos os campos devem ser preenchidos'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    if (passwordController.text != rePasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('As senhas não coincidem'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    try {
      var result = await register(
        emailController.text,
        passwordController.text,
        userController.text,
        phoneNumberController.text,
      );

      if (result) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao registrar. Tente novamente.'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro: $e'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlutterLogo(
            size: 70,
          ),
          MyInput(
            controller: userController,
            placeholder: 'Nome de Usuario',
            type: false,
          ),
          MyInput(
            controller: emailController,
            placeholder: 'Email',
            type: false,
          ),
          MyInput(
            controller: phoneNumberController,
            placeholder: 'Número de Telefone',
            type: false,
          ),
          MyInput(
            controller: passwordController,
            placeholder: 'Senha',
            type: true,
          ),
          MyInput(
            controller: rePasswordController,
            placeholder: 'Confirme sua senha',
            type: true,
          ),
          ElevatedButton(
            onPressed: handleRegister,
            child: Text('Cadastrar'),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            },
            child: Text('Voltar'),
          ),
        ],
      ),
    );
  }
}
