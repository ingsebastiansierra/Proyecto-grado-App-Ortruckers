// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:autentication_firebase/main.dart';
// import 'package:autentication_firebase/profile_page.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class AddNewTravel extends StatefulWidget {
//   @override
//   _AddNewTravelState createState() => _AddNewTravelState();
// }

// class _AddNewTravelState extends State<AddNewTravel> {

//   //Aquí irán las variables y funciones necesarias para la pantalla
//   @override
// Widget build(BuildContext context) {
//     final TextEditingController origenController = TextEditingController();
//     final TextEditingController destinoController = TextEditingController();
//     final TextEditingController fechaController = TextEditingController();
//     final TextEditingController cambioChequeController = TextEditingController();
//     final TextEditingController cargueController = TextEditingController();
//     final TextEditingController celularController = TextEditingController();
//     final TextEditingController combustibleController = TextEditingController();
//     final TextEditingController comisionController = TextEditingController();
//     final TextEditingController descargueController = TextEditingController();
//     final TextEditingController parqueaderoController = TextEditingController();
//     final TextEditingController peajesController = TextEditingController();
//     final TextEditingController recibosController = TextEditingController();
//     final TextEditingController transferenciaController = TextEditingController();

  
//                         void _guardarViaje() async {
//                         // Obtenemos los valores ingresados por el usuario
//                           String origen = _origenController.text;
//                           String destino = _destinoController.text;
//                           DateTime fecha = _fechaController.selectedDate;
//                           Map<String, double> gastosTotales = {
//                           "cambio-cheque": double.parse(_cambioChequeController.text),
//                           "cargue": double.parse(_cargueController.text),
//                           "celular": double.parse(_celularController.text),
//                           "combustible": double.parse(_combustibleController.text),
//                           "comision": double.parse(_comisionController.text),
//                           "descargue": double.parse(_descargueController.text),
//                           "parqueadero": double.parse(_parqueaderoController.text),
//                           "peajes": double.parse(_peajesController.text),
//                           "recibos": double.parse(_recibosController.text),
//                           "transferencia": double.parse(_transferenciaController.text),
//                         };

//                         // Creamos el objeto Viaje con los valores ingresados
//                         Viaje nuevoViaje = Viaje(
//                           origen: origen,
//                           destino: destino,
//                           fecha: fecha,
//                           gastosTotales: gastosTotales,
//                         );

//                         // Creamos una referencia a la colección "viajes" en Firebase Firestore
//                         CollectionReference viajesRef = FirebaseFirestore.instance.collection('viajes');

//                         try {
//                           // Añadimos el nuevo viaje a la colección "viajes"
//                           await viajesRef.add(nuevoViaje.toJson());
//                           // Mostramos un mensaje de éxito
//                           // ignore: use_build_context_synchronously
//                           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                             content: Text('El viaje ha sido agregado correctamente.'),
//                             duration: Duration(seconds: 2),
//                           ));
//                           // Limpiamos los campos de texto
//                           _origenController.clear();
//                           _destinoController.clear();
//                           _fechaController.clear();
//                           _cambioChequeController.clear();
//                           _cargueController.clear();
//                           _celularController.clear();
//                           _combustibleController.clear();
//                           _comisionController.clear();
//                           _descargueController.clear();
//                           _parqueaderoController.clear();
//                           _peajesController.clear();
//                           _recibosController.clear();
//                           _transferenciaController.clear();
//                         } catch (e) {
//                           // Si hay algún error, mostramos un mensaje de error
//                           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                             content: Text('Ocurrió un error al agregar el viaje. Inténtalo de nuevo.'),
//                             duration: Duration(seconds: 2),
//                           ));
//                         }
//                       }






//   return Scaffold(
//     appBar: AppBar(
//       title: Text('Agregar nuevo viaje'),
//     ),
//     body: Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           TextFormField(
//             decoration: InputDecoration(labelText: 'Origen'),
//             controller: origenController,
//           ),
//           TextFormField(
//             decoration: InputDecoration(labelText: 'Destino'),
//             controller: destinoController,
//           ),
//           TextFormField(
//             decoration: InputDecoration(labelText: 'Fecha'),
//             controller: fechaController,
//           ),
//           TextFormField(
//             decoration: InputDecoration(labelText: 'Cambio cheque'),
//             controller: cambioChequeController,
//           ),
//           TextFormField(
//             decoration: InputDecoration(labelText: 'Cargue'),
//             controller: cargueController,
//           ),
//           TextFormField(
//             decoration: InputDecoration(labelText: 'Celular'),
//             controller: celularController,
//           ),
//           TextFormField(
//             decoration: InputDecoration(labelText: 'Combustible'),
//             controller: combustibleController,
//           ),
//           TextFormField(
//             decoration: InputDecoration(labelText: 'Comision'),
//             controller: comisionController,
//           ),
//           TextFormField(
//             decoration: InputDecoration(labelText: 'Descargue'),
//             controller: descargueController,
//           ),
//           TextFormField(
//             decoration: InputDecoration(labelText: 'Parqueadero'),
//             controller: parqueaderoController,
//           ),
//           TextFormField(
//             decoration: InputDecoration(labelText: 'Peajes'),
//             controller: peajesController,
//           ),
//           TextFormField(
//             decoration: InputDecoration(labelText: 'Recibos'),
//             controller: recibosController,
//           ),
//           TextFormField(
//             decoration: const InputDecoration(labelText: 'Transferencia'),
//             controller: transferenciaController,
//           ),
//           const SizedBox(height: 16),
//           ElevatedButton(
//             child: const Text('Guardar'),
//             onPressed: () {
//               _guardarViaje();
//             },
//           )
//         ],
//       ),
//     ),
//   );
// }
// }























// // import 'package:flutter/material.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';

// // class AddNewTravel extends StatefulWidget {
// //   @override
// //   _AddNewTravelState createState() => _AddNewTravelState();
// // }

// // class _AddNewTravelState extends State<AddNewTravel> {
// //   final _formKey = GlobalKey<FormState>();

// //   String _origen;
// //   String _destino;
// //   DateTime _fecha;
// //   Map<String, dynamic> _gastosTotales = {
// //     'cambio-cheque': 0,
// //     'cargue': 0,
// //     'celular': 0,
// //     'combustible': 0,
// //     'comision': 0,
// //     'descargue': 0,
// //     'parqueadero': 0,
// //     'peajes': 0,
// //     'recibos': 0,
// //     'transferencia': 0,
// //   };

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Agregar nuevo viaje'),
// //       ),
// //       body: SingleChildScrollView(
// //         child: Padding(
// //           padding: EdgeInsets.all(20.0),
// //           child: Form(
// //             key: _formKey,
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: <Widget>[
// //                 TextFormField(
// //                   decoration: InputDecoration(
// //                     labelText: 'Origen',
// //                   ),
// //                   validator: (value) {
// //                     if (value.isEmpty) {
// //                       return 'Por favor ingrese el origen del viaje';
// //                     }
// //                     return null;
// //                   },
// //                   onSaved: (value) {
// //                     _origen = value;
// //                   },
// //                 ),
// //                 TextFormField(
// //                   decoration: InputDecoration(
// //                     labelText: 'Destino',
// //                   ),
// //                   validator: (value) {
// //                     if (value.isEmpty) {
// //                       return 'Por favor ingrese el destino del viaje';
// //                     }
// //                     return null;
// //                   },
// //                   onSaved: (value) {
// //                     _destino = value;
// //                   },
// //                 ),
// //                 TextFormField(
// //                   decoration: InputDecoration(
// //                     labelText: 'Fecha',
// //                   ),
// //                   validator: (value) {
// //                     if (value.isEmpty) {
// //                       return 'Por favor ingrese la fecha del viaje';
// //                     }
// //                     return null;
// //                   },
// //                   onTap: () async {
// //                     final DateTime picked = await showDatePicker(
// //                       context: context,
// //                       initialDate: DateTime.now(),
// //                       firstDate: DateTime(2000),
// //                       lastDate: DateTime(2100),
// //                     );
// //                     if (picked != null) {
// //                       setState(() {
// //                         _fecha = picked;
// //                       });
// //                     }
// //                   },
// //                   readOnly: true,
// //                   controller: TextEditingController(
// //                       text: _fecha == null
// //                           ? ''
// //                           : '${_fecha.day}/${_fecha.month}/${_fecha.year}'),
// //                 ),
// //                 Padding(
// //                   padding: const EdgeInsets.symmetric(vertical: 16.0),
// //                   child: Text(
// //                     'Gastos totales',
// //                     style: TextStyle(
// //                       fontSize: 18.0,
// //                       fontWeight: FontWeight.bold,
// //                     ),
// //                   ),
// //                 ),
// //                 TextFormField(
// //                   decoration: InputDecoration(
// //                     labelText: 'Cambio-cheque',
// //                   ),
// //                   keyboardType: TextInputType.number,
// //                   onSaved: (value) {
// //                     _gastosTotales['cambio-cheque'] = int.parse(value);
// //                   },
// //                 ),
// //                 TextFormField(
// //                   decoration: InputDecoration(
// //                     labelText: 'Cargue',
// //                   ),
// //                   keyboardType: TextInputType.number,
// //                   onSaved: (value) {
// //                     _gastosTotales['cargue'] = int.parse(value);
// //                   },
// //                 ),
// //                 TextFormField(
// //                   decoration: InputDecoration(
// //                     labelText: 'descargue',
// //                   ),
// //                   keyboardType: TextInputType.number,
// //                   onSaved: (value) {
// //                     _gastosTotales['descargue'] = int.parse(value);
// //                   },
// //                 ),
// //                  TextFormField(
// //                   decoration: InputDecoration(
// //                     labelText: 'parqueadero',
// //                   ),
// //                   keyboardType: TextInputType.number,
// //                   onSaved: (value) {
// //                     _gastosTotales['parqueadero'] = int.parse(value);
// //                   },
// //                 ),
// //                 TextFormField(
// //                   decoration: InputDecoration(
// //                     labelText: 'comision',
// //                   ),
// //                   keyboardType: TextInputType.number,
// //                   onSaved: (value) {
// //                     _gastosTotales['comision'] = int.parse(value);
// //                   },
// //                 ),
// //                 TextFormField(
// //                   decoration: InputDecoration(
// //                     labelText: 'peajes',
// //                   ),
// //                   keyboardType: TextInputType.number,
// //                   onSaved: (value) {
// //                     _gastosTotales['peajes'] = int.parse(value);
// //                   },
// //                 ),
// //                 TextFormField(
// //                   decoration: InputDecoration(
// //                     labelText: 'combustible',
// //                   ),
// //                   keyboardType: TextInputType.number,
// //                   onSaved: (value) {
// //                     _gastosTotales['combustible'] = int.parse(value);
// //                   },
// //                 ),
// //                 TextFormField(
// //                   decoration: InputDecoration(
// //                     labelText: 'celular',
// //                   ),
// //                   keyboardType: TextInputType.number,
// //                   onSaved: (value) {
// //                     _gastosTotales['celular'] = int.parse(value);
// //                   },
// //                 ),
// //                 TextFormField(
// //                   decoration: InputDecoration(
// //                     labelText: 'recibos',
// //                   ),
// //                   keyboardType: TextInputType.number,
// //                   onSaved: (value) {
// //                     _gastosTotales['recibos'] = int.parse(value);
// //                   },
// //                 ),
// //                 TextFormField(
// //                   decoration: InputDecoration(
// //                     labelText: 'transferencia',
// //                   ),
// //                   keyboardType: TextInputType.number,
// //                   onSaved: (value) {
// //                     _gastosTotales['transferencia'] = int.parse(value);
// //                   },
// //                 ),
                
                   
