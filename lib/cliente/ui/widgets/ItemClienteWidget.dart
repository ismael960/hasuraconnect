import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hasuraconnect/cliente/controller/ClienteController.dart';
import 'package:hasuraconnect/cliente/model/Cliente.dart';
import 'package:hasuraconnect/cliente/ui/screens/AddCliente.dart';
import 'package:hasuraconnect/cliente/ui/widgets/DialogWidget.dart';

class ItemClienteWidget extends StatelessWidget {
  final Cliente cliente;

  ItemClienteWidget({required this.cliente});

  @override
  Widget build(BuildContext context) {
    final clienteCtrl = Get.find<ClienteController>();
    return ListTile(
      leading: Icon(Icons.person),
      title: Text(cliente.name!),
      trailing: Wrap(
        spacing: 15,
        children: [
          GestureDetector(
              child: CircleAvatar(
                child: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                backgroundColor: Colors.white,
              ),
              onTap: () {
                mostrarDialogDobleWidget(
                    context, "Esta seguro de eliminar el cliente",
                    fIzquierda: () {
                  clienteCtrl.eliminarCliente(cliente.identificacion!);
                }, fBotonIDerecha: () {
                  Get.back();
                });
              }),
          GestureDetector(
              child: CircleAvatar(
                child: Icon(
                  Icons.edit,
                  color: Colors.blueAccent,
                ),
                backgroundColor: Colors.white,
              ),
              onTap: () {
                Get.to(AddCliente(cliente: cliente, accion: 2));
              })
        ],
      ),
    );
  }
}
