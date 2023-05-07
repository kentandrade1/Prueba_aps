import 'package:flutter/material.dart';

class Category {
  late final String name;

  Category(this.name);
}

List<Category> categories = [
  Category('Carnes'),
  Category('Bebidas'),
  Category('piqueos'),
  Category('Entrada'),
];

class CategoryListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categorias'),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(categories[index].name),
            onTap: () => _editCategory(context, index),
            onLongPress: () => _deleteCategory(context, index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addCategory(context),
        child: Icon(Icons.add),
      ),
    );
  }

  void _addCategory(BuildContext context) {
    Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => CategoryFormScreen(),
    ),
  );
  }

  void _editCategory(BuildContext context, int index) {
      Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => CategoryFormScreen(category: categories[index]),
    ),
  );
  }

  void _deleteCategory(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('eliminar categoria?'),
          content: Text('seguro de eliminar?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                categories.removeAt(index);
                Navigator.pop(context);
              },
              child: Text('borrar'),
            ),
          ],
        );
      },
    );
  }
}
class CategoryFormScreen extends StatefulWidget {
  final Category? category;

  CategoryFormScreen({this.category});

  @override
  _CategoryFormScreenState createState() => _CategoryFormScreenState();
}

class _CategoryFormScreenState extends State<CategoryFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _name;

  @override
  void initState() {
    super.initState();
    _name = widget.category?.name ?? '';
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category == null ? 'Crear categoria' : 'Editar categoria'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                initialValue: _name,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese el nombre';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (widget.category == null) {
                      categories.add(Category(_name));
                    } else {
                      widget.category!.name = _name;
                    }
                    Navigator.pop(context);
                  }
                },
                child: Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

