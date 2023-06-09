import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class AddGastoPage extends StatefulWidget {
  @override
  _AddGastoPageState createState() => _AddGastoPageState();
}

class _AddGastoPageState extends State<AddGastoPage> {
  late DatabaseReference _gastosRef;
  late List<String> _categorias;
  late String _selectedCategoria;
  late TextEditingController _montoController;
  double _totalGastos = 0;
  late double _sumaGeneral = 0;

  @override
  void initState() {
    super.initState();
    _gastosRef = FirebaseDatabase.instance.ref().child('gastos');
    print(_gastosRef);
    _categorias = [
      'cambio cheque',
      'cargue',
      'celular',
      'combustible',
      'comisión',
      'descargue',
      'parqueadero',
      'peajes',
      'recibos',
      'transferencia'
    ];
    _selectedCategoria = _categorias[0];
    _montoController = TextEditingController();
    _calcularSumaGeneral();
  }

  @override
  void dispose() {
    _montoController.dispose();
    super.dispose();
  }

  Future<void> _agregarGasto() async {
    if (_montoController.text.isEmpty) return;
    final double monto = double.tryParse(_montoController.text) ?? 0;

    final snapshot = await _gastosRef.child(_selectedCategoria).once();

    final totalCategoria = snapshot.snapshot.value != null
        ? double.parse(snapshot.snapshot.value.toString()) + monto
        : monto;

    await _gastosRef
        .child(_selectedCategoria)
        .set(totalCategoria.toStringAsFixed(2));

    setState(() {
      _montoController.clear();
      _totalGastos = totalCategoria;
      _calcularSumaGeneral();
    });
  }

  Future<void> _calcularSumaGeneral() async {
    double suma = 0;
    DataSnapshot snapshot = (await FirebaseDatabase.instance
        .ref()
        .child('gasto')
        .once()) as DataSnapshot;
    dynamic data = snapshot.value;
    if (data != null && data is Map<dynamic, dynamic>) {
      data.forEach((key, value) {
        double fieldValue = double.tryParse(value['campo1'].toString()) ??
            0.0; // Modifica 'campo1' por el nombre del campo que desees recorrer
        suma += fieldValue;
      });
    }
    setState(() {
      _sumaGeneral = suma;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Gasto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Categoría',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            DropdownButton<String>(
              value: _selectedCategoria,
              onChanged: (value) {
                setState(() {
                  _selectedCategoria = value!;
                });
              },
              items: _categorias
                  .map(
                    (categoria) => DropdownMenuItem(
                      value: categoria,
                      child: Text(categoria),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: 16.0),
            Text(
              'Monto',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: _montoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Ingrese el monto del gasto',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _agregarGasto,
              child: Text('Agregar'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Total gastos por categoria \$${_totalGastos.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
