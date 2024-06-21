import 'package:flutter/material.dart';
import 'package:im_hungry/views/categoria.dart';
import 'package:im_hungry/views/pedido.dart';
import 'package:im_hungry/views/restaurante.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _pages = <Widget>[
    HomePageContent(),
    Pedido(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Im Hungry'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Carrinho',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
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
                'price': 'R\$20',
                'image': 'assets/frango_defumado.jpeg',
                'description': 'Cubos de frango defumado misturados com o delicioso cream cheese.'
                ' Uma delicia de dar água da boca. Nos tamanhos de 15cm e 30cm, para você fazer como quiser!',
              },
              {
                'name': 'Sanduíche de Carne Seca com Cream Cheese',
                'price': 'R\$30',
                'image': 'assets/carne_seca.jpg',
                'description': 'Carne Seca com Cream Cheese traz a saborosa combinação de pão italiano,'
                ' carne seca com cream cheese, muçarela ralada, tomate, cebola roxa, alface e maionese.',
              },
              {
                'name': 'Sanduíche de Frango Teriyaki',
                'price': 'R\$15',
                'image': 'assets/frango_teriyaki.jpg',
                'description': 'Frango Teriyaki, com pedaços suculentos de peito de frango e o delicioso molho teriyaki.'
                ' Nos tamanhos de 15cm e 30cm, para você fazer como quiser!',
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
                'price': 'R\$20',
                'image': 'assets/calabresa.jpg',
                'description': 'Calzone de Calabresa com Queijo',
              },
              {
                'name': 'Kalzone de Carne Seca',
                'price': 'R\$30',
                'image': 'assets/carne.png',
                'description': 'Calzone de Carne Seca com Queijo',
              },
              {
                'name': 'Kalzone de 4 Queijos',
                'price': 'R\$15',
                'image': 'assets/queijo.jpg',
                'description': 'Calzone de 4Queijos',
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
                'price': 'R\$20',
                'image': 'assets/almoco.jpeg',
                'description': 'Almoço Executivo contém: Arroz, Feijao, Macarrão, Salada, Carne Bovina e Frango',
              },
              {
                'name': 'Feijoada',
                'price': 'R\$30',
                'image': 'assets/feijoada.jpeg',
                'description': 'Feijoada',
              },
              {
                'name': 'Salada',
                'price': 'R\$15',
                'image': 'assets/salada.jpeg',
                'description': 'Salada',
              },
            ],
          ),
        ),
      ],
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
              'price': '20',
              'description': 'TESTE',
              'image': 'assets/frango_defumado.jpeg',
            },
            {
              'name': 'Sanduíche de Carne Seca',
              'price': '30',
              'description': 'TESTE',
              'image': 'assets/carne_seca.jpg',
            },
            {
              'name': 'Sanduíche de Frango Teriyaki',
              'price': '15',
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
              'price': '20',
              'description': 'TESTE',
              'image': 'assets/calabresa.jpg',
            },
            {
              'name': 'Kalzone de Carne Seca',
              'price': '30',
              'description': 'TESTE',
              'image': 'assets/carne.png',
            },
            {
              'name': 'Kalzone de 4 Queijos',
              'price': '15',
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
              'price': '20',
              'description': 'TESTE',
              'image': 'assets/almoco.jpeg',
            },
            {
              'name': 'Feijoada',
              'price': '30',
              'description': 'TESTE',
              'image': 'assets/feijoada.jpeg',
            },
            {
              'name': 'Salada',
              'price': '15',
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
              'price': '20',
              'description': 'TESTE',
              'image': '',
            },
            {
              'name': '80 pcs Hot',
              'price': '30',
              'description': 'TESTE',
              'image': '',
            },
            {
              'name': 'Combo de Sushi',
              'price': '15',
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