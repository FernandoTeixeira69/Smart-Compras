import "package:flutter/material.dart";
import "package:smart_compras/login.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Flutter Demo',
     home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(55)),
        elevation: 0,
        backgroundColor: const Color(0xFFFF4950),
        centerTitle: true,
        title: const Column(
          //  crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'SMART COMPRAS',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  color: Colors.white),
            ),
            Text(
              'Lista de Compras',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            iconSize: 54,
            icon: const Icon(Icons.account_circle),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Criar uma lista',
        child: Icon(
          Icons.add,
          size: 58,
          color: Colors.white,
        ),
        backgroundColor: Color(0xffff4950),
        shape: CircleBorder(),
        elevation: 8,
        onPressed: () {},
      ),
    );
  }
}
