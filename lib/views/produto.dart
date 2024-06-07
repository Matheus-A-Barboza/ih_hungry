import 'package:flutter/material.dart';

class Produto extends StatelessWidget {
  // const Restaurantes({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    if (args == null){
      return Scaffold(
        appBar: AppBar(
          title: Text('Lanche/Almoço'),
        ),
        body: Center(
          child: Text('Produto não encontrado'),
        ),
      );
    }

    String name = args['name'] ?? 'Sem nome';
    String price = args['price'] ?? 'Sem preço';
    String description = args['description'] ?? 'Sem descrição';
    String logo = args['image'] ?? '';
    

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(name),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(logo),
                      SizedBox(height: 10),
                      Text('Preço: $price'),
                      SizedBox(height: 10),
                      Text('Descrição: $description'),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Fechar'),
                    ),
                  ],
                );
              },
            );
          },
          child: Text('Ver Detalhes'),
        ),
      ),
    );


  }
}