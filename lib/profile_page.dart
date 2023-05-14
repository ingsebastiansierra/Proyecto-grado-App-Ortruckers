import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bills_page.dart';
import 'main.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? uid;
  String? email;
  String? displayName;
  String? photoUrl;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      uid = prefs.getString('uid');
      email = prefs.getString('email');
      displayName = prefs.getString('displayName');
      photoUrl = prefs.getString('photoUrl');
    });
  }

  @override
  Widget build(BuildContext context) {
    final photo = photoUrl != null
        ? Image.network(photoUrl!)
        : Image.asset('assets/perfil.png');
    final name = Text(displayName ?? '');
    final userEmail = Text(email ?? '');
    final userId = Text(uid ?? '');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Perfil'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 5),
          Center(child: photo),
          const SizedBox(height: 0),
          Center(child: name),
          const SizedBox(height: 5),
          Center(child: userEmail),
          const SizedBox(height: 15),
          Center(child: userId),
          const SizedBox(height: 5),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Editar perfil'),
          ),
          const SizedBox(height: 190),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddGastoPage()),
                  );
                },
                icon: const Icon(Icons.receipt),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.settings),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MyApp()),
                  );
                },
                icon: const Icon(Icons.logout),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
