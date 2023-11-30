import 'package:dactilar/local_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool auth = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('login Huella Dactillar')),
        leading: IconButton(
          icon: const Icon(Icons.account_circle),
          onPressed: () {
          },
          ),
      ),
      floatingActionButton: auth == true
          ? null
          : FloatingActionButton(
              onPressed: () async {
                final authen = await LocalAuth.authenticate();
                setState(() {
                  auth = authen;
                });
              },
              child: const Icon(Icons.fingerprint),
        ),
        body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!auth)
              const Icon(
                Icons.warning_amber_rounded,
                size: 100,
                color:Colors.red,
              ),
              if(!auth) const Text('Login: Huella Dactilar',
                      style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.blue // Ajusta este valor según tus necesidades
                      ),
                      ),
            if (auth)const Icon(Icons.check_circle_outline, size: 60, color:Colors.green),
                    const SizedBox(width: 16.0, height: 16.0),
                     if(auth) const Text('Bievenido: Sesión Exitosa',
                      style: TextStyle(
                      fontSize: 24.0, // Ajusta este valor según tus necesidades
                      ),
                      ),
            if (auth)
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      auth = false;
                    });
                  },
                  
                  child: const Text('Eliminar Sesión'))
          ],
        ),
      ),
    );
  }
}