import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hasuraconnect/cliente/controller/ClienteController.dart';
import 'package:hasuraconnect/cliente/ui/widgets/CircularProgressWidget.dart';
import 'package:hasuraconnect/cliente/ui/widgets/ItemClienteWidget.dart';

class ClientesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clientes - HasuraConnect"),
      ),
      body: GetBuilder<ClienteController>(
          init: ClienteController(),
          builder: (_) {
            if (_.loading) {
              return CircularProgressWidget();
            }
            return ListView.builder(
                itemCount: _.clientes.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return ItemClienteWidget(cliente: _.clientes[index]);
                });
          }),
      floatingActionButton: FloatingActionButton(
          heroTag: "crearCliente",
          child: Icon(Icons.add),
          onPressed: () {
            Get.toNamed("/add");
          }),
    );
  }
}
