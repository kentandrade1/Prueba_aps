import 'package:flutter/material.dart';
import 'package:prueba_categorias/cartScreens.dart';
import 'package:prueba_categorias/categoriaScreens.dart';
import 'package:prueba_categorias/productosScreen.dart';

List<Product> carrito=[];
class Product {
  final int id;
  late final String name;
  late final String description;
  late final double price;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });
}

 List<Product> products = [
    Product(
      id: 1,
      name: 'Producto- gallina con todo',
      description: 'gallina entera',
      price: 100.0,
    ),
    Product(
      id: 2,
      name: 'pollito mixto',
      description: 'la mitad del todo',
      price: 200.0,
    ),
    Product(
      id: 3,
      name: 'carne ',
      description: 'carne misteriosa',
      price: 300.0,
    ),
  ];
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '¡Bienvenido a la pantalla de inicio!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                 Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductCRUDPage(),
              ),
            );
              },
              child: Text('Crud productos'),
            ),
              SizedBox(height: 20.0),
               ElevatedButton(
              onPressed: () {
                 Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoryListScreen(),
              ),
            );
              },
              child: Text('Crud categorias'),
            ),
              SizedBox(height: 20.0),

            ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartScreen(selectedProducts: carrito,listProducts: products,),
      ),
    );
  },
  child: Text('Ver carrito'),
),

          ],
        ),
      ),
     
    );
  }
}
