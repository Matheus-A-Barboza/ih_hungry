import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:im_hungry/views/carrinho.dart'; // Certifique-se de ajustar o caminho da importação

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
                      onPressed: (){
                        carrinho.removeFromCarrinho(item);
                      },
                    )
                  ],
                )
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
                  onPressed: () {
                    // Adicione a lógica para finalizar o pedido
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
}
