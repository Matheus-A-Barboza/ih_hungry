import 'package:flutter/material.dart';
import 'package:im_hungry/views/home_page.dart';
import 'package:im_hungry/views/login_page.dart';
// import 'package:im_hungry/views/produto.dart';
import 'package:im_hungry/views/restaurantes.dart';


void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(),
      home: HomePage(),
      routes: {
        '/restaurantes':(context) => Restaurantes(),
        // '/produto':(context) => Produto(),
      },
    ),
  );
}
