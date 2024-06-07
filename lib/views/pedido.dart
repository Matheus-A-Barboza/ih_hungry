import 'package:flutter/material.dart';
import 'package:im_hungry/views/carrinho.dart';

class ShoppingCartPage extends StatelessWidget {
  final Carrinho cart;

  const ShoppingCartPage({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho de Compras'),
      ),
      body: ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = cart.items[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(item.image),
            ),
            title: Text(item.name),
            subtitle: Text(item.price),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                cart.removeFromCarrinho(item);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${item.name} removido do carrinho.'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Total: R\$ ${cart.getTotalPrice().toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  // Ação do botão para finalizar compra
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Compra finalizada.'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: Text('Finalizar Compra'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}