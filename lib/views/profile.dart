import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:im_hungry/views/login_page.dart'; // Importe a tela de login

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  TextEditingController _nameController = TextEditingController();
  String? _userEmail;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    setState(() {
      _nameController.text = user?.displayName ?? '';
      _userEmail = user?.email;
    });
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()), // Navega para a tela de login
    );
  }

  Future<void> _updateProfile() async {
    User? user = FirebaseAuth.instance.currentUser;
    try {
      await user?.updateDisplayName(_nameController.text.trim());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Nome atualizado com sucesso')),
      );
    } catch (e) {
      print('Erro ao atualizar o nome: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao atualizar o nome')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nome',
                hintText: 'Seu nome',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              _userEmail ?? 'Endereço de Email',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateProfile,
              child: Text('Salvar Nome'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _signOut,
              child: Text('Sair'),
            ),
          ],
        ),
      ),
    );
  }
}
