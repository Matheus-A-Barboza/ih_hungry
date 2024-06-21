import 'package:flutter/material.dart';
import 'package:im_hungry/views/carrinho.dart';
import 'package:im_hungry/views/produto.dart';
import 'package:provider/provider.dart';

class Restaurante extends StatelessWidget {
  final String name;
  final String rating;
  final String deliveryTime;
  final String logo;
  final List<Map<String, dynamic>> menu;

  const Restaurante({
    Key? key,
    required this.name,
    required this.rating,
    required this.deliveryTime,
    required this.logo,
    required this.menu,
  }) : super(key: key);

  void _addToCarrinho(BuildContext context, Map<String, dynamic> item) {
    var newItem = Itens(
      name: item['name'],
      price: item['price'],
      description: item['description'],
      image: item['image'],
    );

    Provider.of<CarrinhoModel>(context, listen: false).addToCarrinho(newItem);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${item['name']} adicionado ao carrinho.'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(logo),
        ),
        title: Text(name),
        subtitle: Text('Rating: $rating\nDelivery Time: $deliveryTime'),
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(name),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (var item in menu)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['name'],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(item['description']),
                              Text(item['price']),
                              SizedBox(height: 8),
                              Image.asset(
                                item['image'],
                                width: 100,
                                height: 100,
                              ),
                              SizedBox(height: 8),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  _addToCarrinho(context, item);
                                },
                                child: Text('Adicionar ao Carrinho'),
                                
                              ),
                              Divider(),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                actions: <Widget>[
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
      ),
    );
  }

  
}
