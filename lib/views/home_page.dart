import 'package:flutter/material.dart';
import 'package:im_hungry/views/categoria.dart';
import 'package:im_hungry/views/restaurante.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Im Hungry'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar restaurantes e pratos',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Categorias',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 100,
            child: Center(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Categoria('Pizza', Icons.local_pizza),
                  Categoria('Sushi', Icons.restaurant),
                  Categoria('Burger', Icons.fastfood),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Restaurantes Populares',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          InkWell(
            onTap: () {
              _showRestaurantDetails(context, 'Subway');
            },
            child: Restaurante(
              name: 'Subway',
              rating: '4.5',
              deliveryTime: '10-20 min',
              logo: 'assets/Subway.png',
              menu: [
                {
                  'name': 'Sanduíche de Frango Defumado com Cream Cheese',
                  'price': 'R\$20,00',
                  'description': 'TESTE',
                  'image': 'assets/frango_defumado.jpeg',
                },
                {
                  'name': 'Sanduíche de Carne Seca',
                  'price': 'R\$30,00',
                  'description': 'TESTE',
                  'image': 'assets/carne_seca.jpg',
                },
                {
                  'name': 'Sanduíche de Frango Teriyaki',
                  'price': 'R\$15,00',
                  'description': 'TESTE',
                  'image': 'assets/frango_teriyaki.jpg',
                },
              ],
            ),
          ),
          InkWell(
            onTap: () {
              _showRestaurantDetails(context, 'MiniKalzone');
            },
            child: Restaurante(
              name: 'MiniKalzone',
              rating: '4.2',
              deliveryTime: '20-30 min',
              logo: 'assets/MiniKalzone.jpeg',
              menu: [
                {
                  'name': 'Kalzone de Calabresa',
                  'price': 'R\$20,00',
                  'description': 'TESTE',
                  'image': 'assets/calabresa.jpg',
                },
                {
                  'name': 'Kalzone de Carne Seca',
                  'price': 'R\$30,00',
                  'description': 'TESTE',
                  'image': 'assets/carne.png',
                },
                {
                  'name': 'Kalzone de 4 Queijos',
                  'price': 'R\$15,00',
                  'description': 'TESTE',
                  'image': 'assets/queijo.jpg',
                },
              ],
            ),
          ),
          InkWell(
            onTap: () {
              _showRestaurantDetails(context, 'Girafas');
            },
            child: Restaurante(
              name: 'Girafas',
              rating: '4.8',
              deliveryTime: '15-25 min',
              logo: 'assets/Girafas.jpeg',
              menu: [
                {
                  'name': 'Almoço Executivo',
                  'price': 'R\$20,00',
                  'description': 'TESTE',
                  'image': 'assets/almoco.jpeg',
                },
                {
                  'name': 'Feijoada',
                  'price': 'R\$30,00',
                  'description': 'TESTE',
                  'image': 'assets/feijoada.jpeg',
                },
                {
                  'name': 'Salada',
                  'price': 'R\$15,00',
                  'description': 'TESTE',
                  'image': 'assets/salada.jpeg',
                },
              ],
            ),
          ),
          InkWell(
            onTap: () {
              _showRestaurantDetails(context, 'Hamei');
            },
            child: Restaurante(
              name: 'Hamei',
              rating: '5.0',
              deliveryTime: '25-45 min',
              logo: 'assets/hamei.jpeg',
              menu: [
                {
                  'name': 'Barca de Salmão',
                  'price': 'R\$20,00',
                  'description': 'TESTE',
                  'image': '',
                },
                {
                  'name': '80 pcs Hot',
                  'price': 'R\$30,00',
                  'description': 'TESTE',
                  'image': '',
                },
                {
                  'name': 'Combo de Sushi',
                  'price': 'R\$15,00',
                  'description': 'TESTE',
                  'image': '',
                },
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showRestaurantDetails(BuildContext context, String restaurantName) {
    Map<String, dynamic>? restaurantData;
    switch (restaurantName) {
      case 'Subway':
        restaurantData = {
          'name': 'Subway',
          'logo': 'assets/Subway.png',
          'menu': [
            {
              'name': 'Sanduíche de Frango Defumado com Cream Cheese',
              'price': 'R\$20,00',
              'description': 'TESTE',
              'image': 'assets/frango_defumado.jpeg',
            },
            {
              'name': 'Sanduíche de Carne Seca',
              'price': 'R\$30,00',
              'description': 'TESTE',
              'image': 'assets/carne_seca.jpg',
            },
            {
              'name': 'Sanduíche de Frango Teriyaki',
              'price': 'R\$15,00',
              'description': 'TESTE',
              'image': 'assets/frango_teriyaki.jpg',
            },
          ]
        };
        break;
      case 'MiniKalzone':
        restaurantData = {
          'name': 'MiniKalzone',
          'logo': 'assets/MiniKalzone.jpeg',
          'menu': [
            {
              'name': 'Kalzone de Calabresa',
              'price': 'R\$20,00',
              'description': 'TESTE',
              'image': 'assets/calabresa.jpg',
            },
            {
              'name': 'Kalzone de Carne Seca',
              'price': 'R\$30,00',
              'description': 'TESTE',
              'image': 'assets/carne.png',
            },
            {
              'name': 'Kalzone de 4 Queijos',
              'price': 'R\$15,00',
              'description': 'TESTE',
              'image': 'assets/queijo.jpg',
            },
          ]
        };
        break;
      case 'Girafas':
        restaurantData = {
          'name': 'Girafas',
          'logo': 'assets/Girafas.jpeg',
          'menu': [
            {
              'name': 'Almoço Executivo',
              'price': 'R\$20,00',
              'description': 'TESTE',
              'image': 'assets/almoco.jpeg',
            },
            {
              'name': 'Feijoada',
              'price': 'R\$30,00',
              'description': 'TESTE',
              'image': 'assets/feijoada.jpeg',
            },
            {
              'name': 'Salada',
              'price': 'R\$15,00',
              'description': 'TESTE',
              'image': 'assets/salada.jpeg',
            },
          ]
        };
        break;
      case 'Hamei':
        restaurantData = {
          'name': 'Hamei',
          'logo': 'assets/hamei.jpeg',
          'menu': [
            {
              'name': 'Barca de Salmão',
              'price': 'R\$20,00',
              'description': 'TESTE',
              'image': '',
            },
            {
              'name': '80 pcs Hot',
              'price': 'R\$30,00',
              'description': 'TESTE',
              'image': '',
            },
            {
              'name': 'Combo de Sushi',
              'price': 'R\$15,00',
              'description': 'TESTE',
              'image': '',
            },
          ]
        };
        break;
      default:
        throw Exception('Restaurante não encontrado: $restaurantName');
    }

    Navigator.pushNamed(
      context,
      '/restaurantes',
      arguments: restaurantData,
    );
  }
}

