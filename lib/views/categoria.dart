import 'package:flutter/material.dart';

class Categoria extends StatelessWidget {
  final String name;
  final IconData icon;

  Categoria(this.name, this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40),
              SizedBox(height: 8),
              Text(name, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}