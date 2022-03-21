import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hasuraconnect/cliente/controller/ClienteController.dart';
import 'package:hasuraconnect/cliente/model/Cliente.dart';
import 'package:hasuraconnect/cliente/ui/screens/AddCliente.dart';
import 'package:hasuraconnect/cliente/ui/widgets/CircularProgressWidget.dart';
import 'package:hasuraconnect/cliente/ui/widgets/ItemClienteWidget.dart';

class ClientesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clientes"),
      ),
      body: GetBuilder<ClienteController>(
          init: ClienteController(),
          builder: (_) {
            if (_.loading) {
              return CircularProgressWidget();
            } else {
              return ListView.builder(
                  itemCount: _.clientes.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (__, int index) {
                    return ItemClienteWidget(cliente: _.clientes[index]);
                  });
            }
          }),
      floatingActionButton: FloatingActionButton(
        heroTag: 'addCliente',
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(AddCliente(cliente: Cliente(), accion: 1));
        },
      ),
    );
  }
}
