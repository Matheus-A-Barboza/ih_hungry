import 'package:flutter/material.dart';
import 'package:im_hungry/models/carrinho_model.dart';
import 'package:im_hungry/views/home_page.dart';
import 'package:provider/provider.dart';

class Pedido extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho'),
      ),
      body: Consumer<CarrinhoModel>(
        builder: (context, carrinho, child) {
          return ListView.builder(
            itemCount: carrinho.items.length,
            itemBuilder: (context, index) {
              final item = carrinho.items[index];
              return ListTile(
                leading: Image.asset(item.image, width: 50, height: 50),
                title: Text(item.name),
                subtitle: Text(item.description),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('${item.price}'),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        carrinho.removeFromCarrinho(item);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: Consumer<CarrinhoModel>(
        builder: (context, carrinho, child) {
          return Container(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: R\$ ${carrinho.getTotalPrice().toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: carrinho.items.isEmpty
                      ? null
                      : () {
                          _showPedidoEfetuadoDialog(context, carrinho);
                        },
                  child: Text('Finalizar Pedido'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showPedidoEfetuadoDialog(BuildContext context, CarrinhoModel carrinho) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Pedido efetuado'),
          content: Text('Seu pedido foi efetuado com sucesso!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o dialogo
                carrinho.cleanCart(); // Limpa o carrinho
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => HomePage()),
                  (Route<dynamic> route) => false,
                );
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
