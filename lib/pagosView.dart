import 'package:flutter/material.dart';


class PagoView extends StatelessWidget {
  final precio;
  const PagoView
({Key? key, this.precio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pago view'),
      ),
      body: Center(
        child: SizedBox(
          height: 200,
          width: 400,
          child: Card(
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'numero de tarjeta: xxxxxxxxx',
                  style: TextStyle(fontSize: 24,color: Colors.white),
                ),
                 Text(
                  'total: $precio',
                  style: TextStyle(fontSize: 24,color: Colors.white),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                 
                  },
                  child: Text('Pagar'),
                ),
              
              
          
              ],
            ),
          ),
        ),
      ),
     
    );
  }
}
