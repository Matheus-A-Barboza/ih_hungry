import 'package:flutter/material.dart';
import 'package:im_hungry/views/carrinho.dart';
import 'package:im_hungry/views/pedido.dart';
import 'package:provider/provider.dart';
import 'package:im_hungry/views/home_page.dart';
import 'package:im_hungry/views/login_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CarrinhoModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      // home: LoginPage(),
      routes: {
        '/': (context) => LoginPage(),
        '/homepage': (context) => HomePage(),
        '/carrinho':(context) => Pedido()
      },
    );
  }
}
