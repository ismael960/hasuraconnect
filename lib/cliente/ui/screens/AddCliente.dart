import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hasuraconnect/cliente/controller/ClienteController.dart';
import 'package:hasuraconnect/cliente/model/Cliente.dart';

class AddCliente extends StatelessWidget {
  final Cliente cliente;
  final int accion;

  AddCliente({required this.cliente, required this.accion});

  @override
  Widget build(BuildContext context) {
    final clienteCtrl = Get.find<ClienteController>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Agregar cliente"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        scrollDirection: Axis.vertical,
        child: Form(
            key: clienteCtrl.formKeyCliente,
            child: Column(
              children: [
                TextFormField(
                  initialValue: accion == 1 ? '' : cliente.name,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "Nombre"),
                  onChanged: (newValue) => cliente.name = newValue,
                  onSaved: (newValue) => cliente.name = newValue,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "El campo nombre esta vacio";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  initialValue: accion == 1 ? '' : cliente.street,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "Direccion"),
                  onChanged: (newValue) => cliente.street = newValue,
                  onSaved: (newValue) => cliente.street = newValue,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "El campo direccion esta vacio";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  initialValue: accion == 1 ? '' : cliente.city,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "Ciudad"),
                  onChanged: (newValue) => cliente.city = newValue,
                  onSaved: (newValue) => cliente.city = newValue,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "El campo ciudad esta vacio";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  initialValue: accion == 1 ? '' : cliente.email,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "Email"),
                  onChanged: (newValue) => cliente.email = newValue,
                  onSaved: (newValue) => cliente.email = newValue,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "El campo email esta vacio";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  initialValue: accion == 1 ? '' : cliente.phone,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "Telefono"),
                  onChanged: (newValue) => cliente.phone = newValue,
                  onSaved: (newValue) => cliente.phone = newValue,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "El campo telefono esta vacio";
                    }
                    return null;
                  },
                ),
                // DropdownButtonFormField<String>(
                //   decoration:
                //       InputDecoration(labelText: "Tipo de indentificacion"),
                //   items: Get.find<ClienteController>()
                //       .tiposIdentificacion
                //       .map((String value) {
                //     return DropdownMenuItem<String>(
                //         value: value, child: Text(value));
                //   }).toList(),
                //   onSaved: (newValue) => cliente.tipoIdentificacion = newValue,
                //   value: accion == 1
                //       ? 'Seleccionar'
                //       : cliente.tipoIdentificacion == 'cedula'
                //           ? 'Cedula'
                //           : 'Cedula',
                //   validator: (value) {
                //     if (value == 'Seleccionar' || value == null) {
                //       return "El campo TipoIdentificacion esta vacio";
                //     }
                //     return null;
                //   },
                // ),
                TextFormField(
                  initialValue: accion == 1 ? '' : cliente.identificacion,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "Cedula"),
                  onChanged: (newValue) => cliente.identificacion = newValue,
                  onSaved: (newValue) => cliente.identificacion = newValue,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "El campo identificacion esta vacio";
                    }
                    return null;
                  },
                ),
              ],
            )),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'AddEditCliente',
        child: Icon(Icons.check),
        onPressed: () async {
          if (clienteCtrl.formKeyCliente.currentState!.validate()) {
            clienteCtrl.formKeyCliente.currentState!.save();
            //log("${cliente.toJsonGraphql()}");
            if (accion == 1) {
              await clienteCtrl.insertCliente(cliente);
            }
          }
        },
      ),
    );
  }
}
