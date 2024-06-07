import 'package:flutter/foundation.dart';

class Itens {
  final String name;
  final String price;
  final String description;
  final String image;

  Itens({
    required this.name,
    required this.price,
    required this.description,
    required this.image,
  });
}

class Carrinho {
  final List<Itens> items = [];

  void addToCarrinho(Itens item) {
    items.add(item);
  }

  void removeFromCarrinho(Itens item) {
    items.remove(item);
  }

  int getTotalItems() {
    return items.length;
  }

  double getTotalPrice() {
    double total = 0;
    items.forEach((item) {
      total += double.parse(item.price.replaceAll(RegExp(r'[^\d.]'), ''));
    });
    return total;
  }
}
