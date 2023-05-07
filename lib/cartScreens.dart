import 'package:flutter/material.dart';
import 'package:prueba_categorias/pagosView.dart';

import 'homeScreens.dart';



class CartScreen extends StatefulWidget {
  final List<Product> selectedProducts;
  final List<Product> listProducts;
  const CartScreen({Key? key, required this.selectedProducts, required this.listProducts}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  
  double _totalPrice = 0;

  @override
  void initState() {
    super.initState();
    _calculateTotalPrice();
  }

  void _calculateTotalPrice() {
    double totalPrice = 0;
    for (Product product in widget.selectedProducts) {
      totalPrice += product.price;
    }
    setState(() {
      _totalPrice = totalPrice;
    });
  }
  void _addToCart(Product product) {
  setState(() {
    widget.selectedProducts.add(product);
    _calculateTotalPrice();
  });
}

  void _removeProduct(int index) {
    setState(() {
      widget.selectedProducts.removeAt(index);
      _calculateTotalPrice();
    });
  }

  void _clearCart() {
    setState(() {
      widget.selectedProducts.clear();
      _calculateTotalPrice();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ver Menu seleccionado'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.selectedProducts.length,
              itemBuilder: (context, index) {
                final product = widget.selectedProducts[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text('Cantidad: 1'),
                  trailing: Text('\$${product.price}'),
                  onLongPress:()=> _removeProduct(index),
                  //onTap: () => _removeProduct(index),
                );
              },
            ),
          ),
          
          Expanded(
            child: ListView.builder(
              itemCount: widget.listProducts.length,
              itemBuilder: (context, index) {
                final product = widget.listProducts[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text('Cantidad: 1'),
                  trailing: Text('\$${product.price}'),
                  onTap:()=> _addToCart(product),
                  //onTap: () => _removeProduct(index),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total:'),
                    Text('\$$_totalPrice'),
                  ],
                ),
                 ElevatedButton(
                  child: Text('Pagar carrito'),
                     onPressed: (){
                      if(_totalPrice<=0)
                      return;

                      _clearCart;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PagoView(precio: _totalPrice,),
                  ),
                );} ,
                ),

                SizedBox(height: 20),
               

                ElevatedButton(
                  onPressed: _clearCart,
                  child: Text('Vaciar carrito'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
