import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hasuraconnect/cliente/model/Cliente.dart';
import 'package:hasuraconnect/cliente/ui/screens/AddCliente.dart';
import 'package:hasuraconnect/util/Injection.dart';

import 'cliente/ui/screens/ClientesPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Injection.init();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crud clientes - HasuraConnect',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ClientesPage(),
      getPages: [
        GetPage(
            name: '/add',
            page: () => AddCliente(
                  accion: 1,
                  cliente: Cliente(),
                )),
      ],
    );
  }
}
