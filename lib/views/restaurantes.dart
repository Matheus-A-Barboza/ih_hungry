import 'package:flutter/material.dart';

class Restaurantes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (args == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Restaurante'),
        ),
        body: Center(
          child: Text('Restaurante não encontrado.'),
        ),
      );
    }

    String? name = args['name'];
    String? image = args['image'];
    List<Map<String, String>>? menu = args['menu'];

    if (name == null || image == null || menu == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Restaurante'),
        ),
        body: Center(
          child: Text('Dados do restaurante incompletos.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Menu do $name',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: menu.length,
              itemBuilder: (context, index) {
                var product = menu[index];
                return ListTile(
                  title: Text(product['name'] ?? 'Sem nome'),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(product['name'] ?? 'Sem nome'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (product['image'] != null && product['image']!.isNotEmpty)
                                Image.asset(product['image']!)
                              else
                                SizedBox.shrink(),
                              SizedBox(height: 10),
                              Text('Preço: ${product['price'] ?? 'Sem preço'}'),
                              SizedBox(height: 10),
                              Text('Descrição: ${product['description'] ?? 'Sem descrição'}'),
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
