import 'package:flutter/material.dart';
import 'package:prueba_categorias/homeScreens.dart';




class ProductCRUDPage extends StatefulWidget {
  const ProductCRUDPage({Key? key}) : super(key: key);

  @override
  _ProductCRUDPageState createState() => _ProductCRUDPageState();
}

class _ProductCRUDPageState extends State<ProductCRUDPage> {
 
  

  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _priceController = TextEditingController();

  bool _isUpdating = false;
  int? _selectedId;

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  void _addProduct() {
    setState(() {
      int newId = products.isNotEmpty ? products.last.id + 1 : 1;

      products.add(
        Product(
          id: newId,
          name: _nameController.text,
          description: _descriptionController.text,
          price: double.tryParse(_priceController.text) ?? 0.0,
        ),
      );

      _nameController.clear();
      _descriptionController.clear();
      _priceController.clear();
    });
  }

  void _updateProduct() {
    setState(() {
      final product = products.firstWhere((p) => p.id == _selectedId);

      product.name = _nameController.text;
      product.description = _descriptionController.text;
      product.price = double.tryParse(_priceController.text) ?? 0.0;

      _nameController.clear();
      _descriptionController.clear();
      _priceController.clear();
      _isUpdating = false;
      _selectedId = null;
    });
  }

  void _deleteProduct(int id) {
    setState(() {
      products.removeWhere((p) => p.id == id);
    });
  }

  void _editProduct(int id) {
    setState(() {
      final product = products.firstWhere((p) => p.id == id);

      _nameController.text = product.name;
      _descriptionController.text = product.description;
      _priceController.text = product.price.toString();
      _isUpdating = true;
      _selectedId = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos CRUD'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(70.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nombre',
              ),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Descripción',
              ),
            ),
            TextField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Precio',
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
            onPressed: _isUpdating ? _updateProduct : _addProduct,
            child: Text(_isUpdating ? 'actualizar' : 'agregar'),
            ),
            SizedBox(height: 20.0),
            Expanded(
            child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
            final product = products[index];
                        return ListTile(
                title: Text(product.name),
                subtitle: Text(product.description),
                trailing: Text(product.price.toString()),
                onTap: () => _editProduct(product.id),
                onLongPress: () => _deleteProduct(product.id),
              );
            },
          ),
        ),
          ],
        ),
      ),
);
}
}