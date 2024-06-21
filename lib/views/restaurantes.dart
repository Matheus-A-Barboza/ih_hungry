// import 'package:flutter/material.dart';

// class Restaurantes extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final Map<String, dynamic>? restaurantData = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

//     if (restaurantData == null) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('Detalhes do Restaurante'),
//         ),
//         body: Center(
//           child: Text('Restaurante não encontrado!'),
//         ),
//       );
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(restaurantData['name']),
//       ),
//       body: ListView.builder(
//         itemCount: restaurantData['menu'].length,
//         itemBuilder: (context, index) {
//           final item = restaurantData['menu'][index];
//           return ListTile(
//             leading: Image.asset(item['image'], width: 50, height: 50),
//             title: Text(item['name']),
//             subtitle: Text(item['description']),
//             trailing: Text(item['price']),
//           );
//         },
//       ),
//     );
//   }
// }